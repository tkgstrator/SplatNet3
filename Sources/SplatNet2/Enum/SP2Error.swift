//
//  SP2Error.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/05/06.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Alamofire
import Foundation

public enum SP2Error: Error {
    case requestAdaptionFailed(reason: String?, statusCode: Int?)
    case responseSerializationFailed(reason: String?, statusCode: Int?)
}
