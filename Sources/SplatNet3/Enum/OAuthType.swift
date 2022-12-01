//
//  DataRequest.swift
//  Common
//
//  Created by tkgstrator on 2022/08/12.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation

/// トークンを取得するゲームの種類
public enum ContentId: Int, CaseIterable, Identifiable {
    public var id: Int { rawValue } 
    ///  スプラトゥーン2
    case SP2 = 5_741_031_244_955_648
    ///  スプラトゥーン3
    case SP3 = 4_834_290_508_791_808

    var requestURL: URL {
        switch self {
        case .SP2:
            return URL(unsafeString: "https://app.splatoon2.nintendo.net/")
        case .SP3:
            return URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/")
        }
    }
}
