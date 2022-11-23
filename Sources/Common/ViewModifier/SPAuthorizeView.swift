//
//  SPAuthorizeView.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import SwiftUI
import WebKit

struct SPAuthorizeView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    typealias OnProcess = () -> Void
    typealias Completion = (Result<UserInfo, Error>) -> ()

    let onProcess: OnProcess
    let completion: Completion

    final class Coordinator: NSObject, WKURLSchemeHandler {
        let state: String = String.randomString
        let verifier: String = String.randomString
        let session: Authorize = Authorize()
        let completion: Completion
        let onProcess: OnProcess

        init(onProcess: @escaping OnProcess, completion: @escaping Completion) {
            self.onProcess = onProcess
            self.completion = completion
        }

        /// URLSchemeを踏んだ時に実行される
        func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
            let hosting: UIHostingController = UIHostingController(rootView: SignInView())
            UIApplication.shared.rootViewController?.present(hosting, animated: true, completion: {
                print("Dismiss")
            })
            print(UIApplication.shared.rootViewController)
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

        func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }

    func makeUIView(context: Context) -> WKWebView {
        SPWebView(coordinator: context.coordinator)
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct SPAuthorizeView_Previews: PreviewProvider {
    @State private static var isPresented: Bool = false

    static var previews: some View {
        SPAuthorizeView(onProcess: {
            
        }, completion: { account in
            print(account)
        })
    }
}
