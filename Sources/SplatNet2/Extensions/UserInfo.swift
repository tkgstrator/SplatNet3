//
//  UserInfo.swift
//  SplatNet2
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation
import Common

extension OAuthCredential {
    init(
        sessionToken: SessionToken.Response,
        splatoonToken: SplatoonToken.Response,
        splatoonAccessToken: SplatoonAccessToken.Response,
        iksmSession: IksmSession.Response
    ) {
        self.init(
            nsaid: splatoonToken.result.user.nsaId,
            iksmSession: iksmSession.iksmSession,
            bulletToken: nil,
            sessionToken: sessionToken.sessionToken,
            gameServiceToken: splatoonToken.result.webApiServerCredential.accessToken,
            gameWebToken: splatoonAccessToken.result.accessToken
        )
    }
}

extension UserInfo {
    init(sessionToken: SessionToken.Response,
         splatoonToken: SplatoonToken.Response,
         splatoonAccessToken: SplatoonAccessToken.Response,
         iksmSession: IksmSession.Response
    ) {
        self.init(
            sessionToken: sessionToken.sessionToken,
            splatoonToken: splatoonToken,
            splatoonAccessToken: splatoonAccessToken,
            iksmSession: iksmSession
        )
    }

    init(sessionToken: String,
         splatoonToken: SplatoonToken.Response,
         splatoonAccessToken: SplatoonAccessToken.Response,
         iksmSession: IksmSession.Response
    ) {
        self.init(
            nickname: splatoonToken.result.user.name,
            membership: splatoonToken.result.user.links.nintendoAccount.membership.active,
            friendCode: splatoonToken.result.user.links.friendCode.id,
            thumbnailURL: URL(unsafeString: splatoonToken.result.user.imageUri),
            nsaid: splatoonToken.result.user.nsaId,
            iksmSession: iksmSession.iksmSession,
            bulletToken: nil,
            sessionToken: sessionToken,
            gameServiceToken: splatoonToken.result.webApiServerCredential.accessToken,
            gameWebToken: splatoonAccessToken.result.accessToken
        )
    }
}
