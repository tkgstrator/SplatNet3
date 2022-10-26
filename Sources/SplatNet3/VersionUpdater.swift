//
//  VersionUpdater.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/10/26.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Common
import Alamofire
import UIKit

public class VersionUpdater {
    public static let shared: VersionUpdater = VersionUpdater()

    private init() {}

    @discardableResult
    public func executeVersionCheck() async -> Bool {
        let url: URL = URL(unsafeString: "https://apps.apple.com/app/id1641721384")
        let session: Session = Session()

        do {
            /// 配信されている最新のバージョンを取得
            let version: Version.Response = Version.Response(from: try await session.request(url)
                .validationWithNXError()
                .serializingString()
                .value)
            let publishedVersion: String = version.version

            /// 起動しているアプリのバージョンを取得
            guard let currentVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
            else {
                return false
            }

            if publishedVersion != currentVersion {
                let alert: UIAlertController = await UIAlertController(title: .Common_Ikaring3, message: .Widgets_ErrorsUpdateRequired)
                let action: UIAlertAction = await UIAlertAction(title: .Landing_OpenApp)
                let cancel: UIAlertAction = await UIAlertAction(title: .Common_Cancel, style: .cancel)
                await alert.addAction(action)
                await alert.addAction(cancel)
                await UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
            }

            return true
        } catch {
            return false
        }
    }
}

extension UIAlertAction {
    convenience init(title: LocalizedType) {
        self.init(title: NSLocalizedString(title.rawValue, bundle: .module, comment: ""), style: .default, handler: { _ in
            Task {
               await UIApplication.shared.openURL(URL(unsafeString: "https://apps.apple.com/app/id1641721384"))
            }
        })
    }

    convenience init(title: LocalizedType, style: Style) {
        self.init(title: NSLocalizedString(title.rawValue, bundle: .module, comment: ""), style: .cancel, handler: nil)
    }
}
extension UIAlertController {
    convenience init(title: LocalizedType, message: LocalizedType) {
        self.init(
            title: NSLocalizedString(title.rawValue, bundle: .module, comment: ""),
            message: NSLocalizedString(message.rawValue, bundle: .module, comment: ""),
            preferredStyle: .alert)
    }
}
