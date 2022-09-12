//
//  ViewModifier.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/03.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import SwiftUI
import BetterSafariView
import Common
import Alamofire

public struct Authorize: ViewModifier {
    @Binding var isPresented: Bool
    let session: SplatNet3
    let state: String = String.randomString
    let verifier: String = String.randomString
    let oauthURL: URL

    public init(isPresented: Binding<Bool>, session: SplatNet3) {
        self._isPresented = isPresented
        self.session = session
        self.oauthURL = URL(state: state, verifier: verifier)
    }

    public func body(content: Content) -> some View {
        content
            .webAuthenticationSession(isPresented: $isPresented, content: {
                WebAuthenticationSession(url: oauthURL, callbackURLScheme: "npf71b963c1b7b6d119", completionHandler: { (callbackURL, error) in
                    guard let sessionTokenCode: String = callbackURL?.absoluteString.capture(pattern: "de=(.*)&", group: 1) else {
                        return
                    }

                    Task {
                        let account: UserInfo = try await session.getCookie(code: sessionTokenCode, verifier: verifier)
                        try session.add(account)
                    }
                })
            })
    }
}

public extension View {
    func authorize(isPresented: Binding<Bool>, session: SplatNet3) -> some View {
        self.modifier(Authorize(isPresented: isPresented, session: session))
    }
}
