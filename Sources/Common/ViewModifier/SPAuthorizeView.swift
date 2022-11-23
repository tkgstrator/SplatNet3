//
//  SPAuthorizeView.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import SwiftUI
import WebKit

public struct SPAuthorizeView: UIViewRepresentable {
    public typealias UIViewType = WKWebView
    public typealias Completion = (Result<UserInfo, Error>) -> ()

    let completion: Completion

    final public class Coordinator: NSObject, WKURLSchemeHandler {
        let state: String = String.randomString
        let verifier: String = String.randomString
        let session: Authorize = Authorize()
        let completion: Completion

        init(completion: @escaping Completion) {
            self.completion = completion
        }

        /// URLSchemeを踏んだ時に実行される
        public func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
            guard let oauthURL: String = urlSchemeTask.request.url?.absoluteString,
                  let sessionTokenCode: String = oauthURL.capture(pattern: "de=(.*)&", group: 1)
            else {
                return
            }
            Task {
                do {
                    completion(.success(try await session.getBulletToken(code: sessionTokenCode, verifier: verifier)))
                } catch (let error) {
                    completion(.failure(error))
                }
            }
        }

        public func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }

    public func makeUIView(context: Context) -> WKWebView {
        SPWebView(coordinator: context.coordinator)
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct SPAuthorizeView_Previews: PreviewProvider {
    @State private static var isPresented: Bool = false

    static var previews: some View {
        SPAuthorizeView(completion: { account in
            print(account)
        })
    }
}
