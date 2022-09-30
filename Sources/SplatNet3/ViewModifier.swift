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

public typealias CompletionHandler = (Result<String, Error>) -> Void

private struct Authorize: ViewModifier {

    @Binding private var isPresented: Bool
    let state: String = String.randomString
    let verifier: String = String.randomString
    let oauthURL: URL
    let completion: CompletionHandler

    public init(
        isPresented: Binding<Bool>,
        completion: @escaping CompletionHandler)
    {
        self._isPresented = isPresented
        self.oauthURL = URL(state: state, verifier: verifier)
        self.completion = completion
    }

    public func body(content: Content) -> some View {
        content
            .webAuthenticationSession(isPresented: $isPresented, content: {
                WebAuthenticationSession(url: oauthURL, callbackURLScheme: "npf71b963c1b7b6d119", completionHandler: { (callbackURL, error) in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    guard let sessionTokenCode: String = callbackURL?.absoluteString.capture(pattern: "de=(.*)&", group: 1) else {
                        completion(.failure(Failure.API(error: .response)))
                        return
                    }
                    completion(.success(sessionTokenCode))
                })
            })
    }
}

public extension View {
    func authorize(isPresented: Binding<Bool>, completion: @escaping CompletionHandler) -> some View {
        self.modifier(Authorize(isPresented: isPresented, completion: completion))
    }
}

