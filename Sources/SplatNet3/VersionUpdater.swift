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
    public static func launchAsTestFlight() -> LaunchType {
        #if DEBUG
        return .Debug
        #else
        return Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" ? .TestFlight : .AppStore
        #endif
    }

    public static func executeVersionCheck() {
        let url: URL = URL(unsafeString: "https://apps.apple.com/app/id1641721384")
        let session: Session = Session()

        Task {
            /// 起動しているアプリのバージョンを取得
            guard let response: String = try? await session.request(url).validationWithNXError().serializingString().value,
                  let currentVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
            else {
                return
            }
            /// 最新のバージョンを取得
            let publishedVersion: String = Version.Response(from: response).version

            print(publishedVersion, currentVersion, publishedVersion > currentVersion)
            /// 最新のバージョンより下だとアラートを表示する
            if publishedVersion > currentVersion {
                let alert: UIAlertController = await UIAlertController(title: .Common_App_Salmonia, message: .Common_App_Update_Required)
                let action: UIAlertAction = await UIAlertAction(title: .Landing_OpenApp)
                let cancel: UIAlertAction = await UIAlertAction(title: .Common_Cancel, style: .cancel)
                await alert.addAction(cancel)
                await alert.addAction(action)
                await UIApplication.shared.rootViewController?.present(alert, animated: true)
            }
//            /// 最新のバージョンより高いとアラートを表示する
//            if publishedVersion < currentVersion {
//                let alert: UIAlertController = await UIAlertController(title: .Common_App_Salmonia, message: .Common_Welcome_App)
//                let action: UIAlertAction = await UIAlertAction(title: .Landing_OpenApp)
//                let cancel: UIAlertAction = await UIAlertAction(title: .Common_Cancel, style: .cancel)
//                await alert.addAction(cancel)
//                await alert.addAction(action)
//                await UIApplication.shared.rootViewController?.present(alert, animated: true)
//            }
            return
        }
    }
}

public extension UIApplication {
    var rootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })?
            .windows.first?.rootViewController
    }
}

extension UIAlertAction {
    convenience init(title: LocalizedType) {
        self.init(title: NSLocalizedString(title.rawValue, bundle: .module, comment: ""), style: .default, handler: { _ in
            Task {
                let url: URL = URL(unsafeString: "https://apps.apple.com/app/id1641721384")
                if UIApplication.shared.canOpenURL(url) {
                    await UIApplication.shared.open(url)
                }
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
