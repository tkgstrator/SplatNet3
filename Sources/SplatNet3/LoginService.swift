//
//  SplatNet3.swift
//  SplatNet3
//
//  Created by tkgstrator on 2022/08/13.
//  Copyright © 2022 Magi, Corporation. All rights reserved.
//

import Foundation
import SwiftUI
import Common

public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}

public extension Color {
    init(hex: String, alpha: CGFloat = 1.0) {
        self.init(UIColor(hex: hex, alpha: alpha))
    }
}

internal struct LoginProgress: Identifiable {
    var id: String { path }
    
    enum API: String, CaseIterable {
        case nso    = "NSO"
        case app    = "APP"
        case imink  = "IMINK"

        var color: Color {
            switch self {
            case .nso:
                return Color(hex: "#D33826")
            case .app:
                return Color(hex: "#FF318E")
            case .imink:
                return Color(hex: "#1ACE3B")
            }
        }
    }

    let path: String
    var type: API {
        switch path {
        case "lookup?id=1234806557":
            return .nso
        case "connect/1.0.0/api/session_token":
            return .nso
        case "connect/1.0.0/api/token":
            return .nso
        case "f":
            return .imink
        case "v3/Account/Login":
            return .app
        case "v2/Game/GetWebServiceToken":
            return .app
        case "api/bullet_tokens":
            return .app
        default:
            return .nso
        }
    }
}

internal class LoginService: SplatNet3, ObservableObject {
    @Published var loginProgress: [LoginProgress] = []

    override func authorize<T>(_ request: T) async throws -> T.ResponseType where T : RequestType {
        loginProgress.append(LoginProgress(path: request.path))
        return try await super.authorize(request)
    }
}
