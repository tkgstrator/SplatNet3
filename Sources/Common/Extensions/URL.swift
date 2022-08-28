//
//  URL.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/12/21.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation

public extension URL {
    /// 文字列からUnsafeにURLを作成するイニシャライザ
    init(unsafeString: String) {
        // swiftlint:disable:next force_unwrapping
        self.init(string: unsafeString)!
    }

    init(state: String, verifier: String) {
        let parameters: [String: String] = [
            "state": state,
            "redirect_uri": "npf71b963c1b7b6d119://auth",
            "client_id": "71b963c1b7b6d119",
            "scope": "openid+user+user.birthday+user.mii+user.screenName",
            "response_type": "session_token_code",
            "session_token_code_challenge": verifier.codeChallenge,
            "session_token_code_challenge_method": "S256",
            "theme": "login_form",
        ]
        self.init(string: "https://accounts.nintendo.com/connect/1.0.0/authorize?\(parameters.queryString)")!
    }
}
