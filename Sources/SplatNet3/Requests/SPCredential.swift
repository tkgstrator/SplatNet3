//
//  SPCredential.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import Alamofire

protocol SPCredential: AuthenticationCredential, Codable {
    /// ユーザーID
    var nsaid: String { get set }
    /// スプラトゥーン2で使われる認証トークン
    var iksmSession: String? { get set }
    /// スプラトゥーン3で使われる認証トークン
    var bulletToken: String? { get set }
    /// セッショントークン
    var sessionToken: String { get set }
    /// スプラトゥーントークン
    var gameServiceToken: String { get set }
    /// スプラトゥーンアクセストークン
    var gameWebToken: String { get set }
    /// 有効期限
    var expiration: Date { get set }
    /// 認証トークンのリフレッシュが必要かどうか(2時間に1回リフレッシュが必要)
    var requiresRefresh: Bool { get }
    /// GameWebTokenのリフレッシュが必要かどうか(6.5時間に1回リフレッシュが必要)
    var requiresGameWebTokenRefresh: Bool { get }

    init(
        sessionToken: String,
        gameServiceToken: GameServiceToken.Response,
        gameWebToken: String,
        bulletToken: BulletToken.Response
    )

    init(
        sessionToken: String,
        gameServiceToken: GameServiceToken.Response,
        gameWebToken: GameWebToken.Response,
        iksmSession: IksmSession.Response
    )
}
