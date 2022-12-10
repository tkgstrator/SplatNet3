//
//  SwiftyBeaver.swift
//  
//
//  Created by devonly on 2022/12/05.
//

import Foundation
import SwiftyBeaver

public let SwiftyLogger: SwiftyBeaver.Type = {
    let logger: SwiftyBeaver.Type = SwiftyBeaver.self
    let format: String = "$DHH:mm:ss.SSS$d $N.$F:$l - $M"
    logger.addDestination(FileDestination(format: format))
    logger.addDestination(ConsoleDestination(format: format))
    return logger
}()

public extension SwiftyBeaver {
    class func addDestination(appId: String, appSecret: String, encryptionKey: String) {
        let format: String = "$DHH:mm:ss.SSS$d $N.$F:$l - $M"
        let platform: SBPlatformDestination = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        platform.format = format
        self.addDestination(platform)
    }
}

extension ConsoleDestination {
    /// コンソールには全て出力
    convenience init(format: String) {
        self.init()
        self.format = format
        self.minLevel = .verbose
    }
}

extension FileDestination {
    /// ファイルにはInfo以上を出力
    convenience init(format: String) {
        self.init()
        self.format = format
        self.minLevel = .info
    }
}

extension SBPlatformDestination {
    /// クラウドにはWarning以上を出力
    convenience init(format: String, appId: String, appSecret: String, encryptionKey: String) {
        self.init(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.format = format
        self.minLevel = .warning
    }
}
