//
//  UserInfo.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.

import Foundation
import Common

extension OAuthCredential {
    init(sessionToken: SessionToken.Response, splatoonToken: SplatoonToken.Response, bulletToken: BulletToken.Response) {
        self.init(
            nsaid: splatoonToken.result.user.nsaId,
            iksmSession: nil,
            bulletToken: bulletToken.bulletToken,
            sessionToken: sessionToken.sessionToken,
            splatoonToken: splatoonToken.result.webApiServerCredential.accessToken
        )
    }
}

extension UserInfo {
    init(sessionToken: SessionToken.Response,
         splatoonToken: SplatoonToken.Response,
         bulletToken: BulletToken.Response
    ) {
        self.init(sessionToken: sessionToken.sessionToken, splatoonToken: splatoonToken, bulletToken: bulletToken)
    }

    init(sessionToken: String,
         splatoonToken: SplatoonToken.Response,
         bulletToken: BulletToken.Response
    ) {
        self.init(
            nickname: splatoonToken.result.user.name,
            membership: splatoonToken.result.user.links.nintendoAccount.membership.active,
            friendCode: splatoonToken.result.user.links.friendCode.id,
            thumbnailURL: URL(unsafeString: splatoonToken.result.user.imageUri),
            nsaid: splatoonToken.result.user.nsaId,
            iksmSession: nil,
            bulletToken: bulletToken.bulletToken,
            sessionToken: sessionToken,
            splatoonToken: splatoonToken.result.webApiServerCredential.accessToken
        )
    }
}
