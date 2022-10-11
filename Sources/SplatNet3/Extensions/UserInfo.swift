//
//  UserInfo.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation
import Common

extension OAuthCredential {
    init(
        sessionToken: SessionToken.Response,
        gameServiceToken: SplatoonToken.Response,
        gameWebToken: SplatoonAccessToken.Response,
        bulletToken: BulletToken.Response
    ) {
        self.init(
            nsaid: gameServiceToken.result.user.nsaId,
            iksmSession: nil,
            bulletToken: bulletToken.bulletToken,
            sessionToken: sessionToken.sessionToken,
            gameServiceToken: gameServiceToken.result.webApiServerCredential.accessToken,
            gameWebToken: gameWebToken.result.accessToken
        )
    }
}

extension UserInfo {
    /// イカリング3
    init(sessionToken: SessionToken.Response,
         gameServiceToken: SplatoonToken.Response,
         gameWebToken: SplatoonAccessToken.Response,
         bulletToken: BulletToken.Response
    ) {
        self.init(
            nickname: gameServiceToken.result.user.name,
            membership: gameServiceToken.result.user.links.nintendoAccount.membership.active,
            friendCode: gameServiceToken.result.user.links.friendCode.id,
            thumbnailURL: URL(unsafeString: gameServiceToken.result.user.imageUri),
            nsaid: gameServiceToken.result.user.nsaId,
            iksmSession: nil,
            bulletToken: bulletToken.bulletToken,
            sessionToken: sessionToken.sessionToken,
            gameServiceToken: gameServiceToken.result.webApiServerCredential.accessToken,
            gameWebToken: gameWebToken.result.accessToken
        )
    }

    /// イカリング3
    init(sessionToken: String,
         gameServiceToken: SplatoonToken.Response,
         gameWebToken: SplatoonAccessToken.Response,
         bulletToken: BulletToken.Response
    ) {
        self.init(
            nickname: gameServiceToken.result.user.name,
            membership: gameServiceToken.result.user.links.nintendoAccount.membership.active,
            friendCode: gameServiceToken.result.user.links.friendCode.id,
            thumbnailURL: URL(unsafeString: gameServiceToken.result.user.imageUri),
            nsaid: gameServiceToken.result.user.nsaId,
            iksmSession: nil,
            bulletToken: bulletToken.bulletToken,
            sessionToken: sessionToken,
            gameServiceToken: gameServiceToken.result.webApiServerCredential.accessToken,
            gameWebToken: gameWebToken.result.accessToken
        )
    }
}
