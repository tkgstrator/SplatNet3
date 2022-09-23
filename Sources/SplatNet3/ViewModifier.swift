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

private struct Authorize: ViewModifier {
    @Binding private var isPresented: Bool
    let session: SplatNet3
    let state: String = String.randomString
    let verifier: String = String.randomString
    let oauthURL: URL
    let onDismiss: () -> Void
    let onPresent: () -> Void
    let onFailure: () -> Void

    public init(
        isPresented: Binding<Bool>,
        session: SplatNet3,
        onPresent: @escaping () -> Void = {},
        onDismiss: @escaping () -> Void = {},
        onFailure: @escaping () -> Void = {})
    {
        self._isPresented = isPresented
        self.session = session
        self.oauthURL = URL(state: state, verifier: verifier)
        self.onDismiss = onDismiss
        self.onPresent = onPresent
        self.onFailure = onFailure
    }

    public func body(content: Content) -> some View {
        content
            .webAuthenticationSession(isPresented: $isPresented, content: {
                WebAuthenticationSession(url: oauthURL, callbackURLScheme: "npf71b963c1b7b6d119", completionHandler: { (callbackURL, error) in
                    guard let sessionTokenCode: String = callbackURL?.absoluteString.capture(pattern: "de=(.*)&", group: 1) else {
                        return
                    }

                    Task {
                        do {
                            // サインインが始まったときに実行される
                            onPresent()
                            let account: UserInfo = try await session.getCookie(code: sessionTokenCode, verifier: verifier)
                            try session.set(account)
                            session.account = account
                            // サインインが終わったときに実行される
                            onDismiss()
                        } catch {
                            onFailure()
                        }
                    }
                })
            })
    }
}

public extension View {
    func authorize(isPresented: Binding<Bool>, session: SplatNet3) -> some View {
        self.modifier(Authorize(isPresented: isPresented, session: session))
    }

    func authorize(isPresented: Binding<Bool>, session: SplatNet3, onPresent: @escaping () -> Void, onDismiss: @escaping () -> Void, onFailure: @escaping () -> Void) -> some View {
        self.modifier(Authorize(isPresented: isPresented, session: session, onPresent: onPresent, onDismiss: onDismiss, onFailure: onFailure))
    }
}

