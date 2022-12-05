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

extension ConsoleDestination {
    convenience init(format: String) {
        self.init()
        self.format = format
        self.minLevel = .verbose
    }
}

extension FileDestination {
    convenience init(format: String) {
        self.init()
        self.format = format
        self.minLevel = .warning
    }
}

extension SBPlatformDestination {
    convenience init(format: String, appId: String, appSecret: String, encryptionKey: String) {
        self.init(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)
        self.format = format
        self.minLevel = .error
    }
}
