//
//  EventKey.swift
//  
//
//  Created by devonly on 2022/11/25.
//

import Foundation

public enum EventKey: String, Identifiable,CaseIterable, Codable {
    public var id: String { rawValue }

    case Water_Levels       = "c3edad579f6ad3d2195a99c6ccbad74d74ddb6121d1476c6270436d90c8a475d"
    case Rush               = "fd468293bf7ee52c7b0ac1a2cdc3c14f0024817c58e96e82bd4b6411f9119d66"
    case Goldie_Seeking     = "a1c78221f5339e43241429febb44cabb6eac59c8e38ec568fb32e814b6fe3259"
    case Griller            = "447b1afa07c561e899df7e81aca5d25024c25642f43008d8e3869e9485b0f2e9"
    case The_Mothership     = "b5e5277056e51eef9abed19e58ba66156264b6bbed638e62f6e89050121f6ea4"
    case Fog                = "19b470fc944350da2f71dcd7dc939efa5441fb812bb435fb7c908ebe78ced1fb"
    case Cohock_Charge      = "02338462199c4ada0ba7ca86097da98b6ffc138e6a4a54f521ed351259d8adad"
    case Giant              = "3657f12385cd1cde2c9ce89144e2b5369cdea5bedc47ec602bda08e626ee9e7b"
    case Mudmouth           = "83112387a9106ecf254ca291f831fbbf5925f9712387449de2d8ca75796b6e7c"
}
