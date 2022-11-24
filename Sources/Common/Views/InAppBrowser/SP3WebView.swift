//
//  SP3WebView.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import SwiftUI
import WebKit
import Alamofire
import SDBridgeSwift

public struct SP3WebView: UIViewControllerRepresentable {
    let account: UserInfo?

    public init(account: UserInfo?) {
        self.account = account
    }

    public func makeUIViewController(context: Context) -> WebViewController {
        WebViewController(account: account)
    }

    public func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
    }

    public final class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
        private var bridge: WebViewJavascriptBridge
        private var observer: NSKeyValueObservation?
        private let session: Authorize = Authorize()
        private let account: UserInfo?
        private let configuration: WKWebViewConfiguration = WKWebViewConfiguration()
        private var cookie: HTTPCookie {
            guard let gtoken: String = account?.gameWebToken else {
                return HTTPCookie()
            }

            return HTTPCookie(properties: [
                HTTPCookiePropertyKey.name: "_gtoken",
                HTTPCookiePropertyKey.value: gtoken,
                HTTPCookiePropertyKey.domain: URL(string: "https://api.lp1.av5ja.srv.nintendo.net/")!.host!,
                HTTPCookiePropertyKey.path: "/"])!
        }

        init(account: UserInfo?) {
            let webView: WKWebView = WKWebView(frame: .zero, configuration: configuration)
            self.account = account
            self.bridge = WebViewJavascriptBridge(webView: webView)

            super.init(nibName: nil, bundle: nil)

            self.bridge.consolePipeClosure = { content in
                self.evaluateJavaScript(content)
            }

            webView.isOpaque = false
            webView.backgroundColor = UIColor(SPColor.SplatNet3.SPBackground)
            webView.uiDelegate = self
            webView.navigationDelegate = self

            /// URLを設定
            let request: URLRequest = URLRequest(url: URL(unsafeString: "https://api.lp1.av5ja.srv.nintendo.net/"))

            configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
                webView.load(request)
            }
            self.view = webView
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func evaluateJavaScript(_ content: Any?) {
            guard let script: NSScriptMessage = NSScriptMessage(rawValue: content) else {
                return
            }

            switch script {
            case .closeWebView:
                dismiss(animated: true)
            case .reloadExtension:
                break
            case .completeLoading:
                break
            case .invokeNativeShare(let content):
                break
            case .invokeNativeShareUrl(let content):
                break
            case .copyToClipboard(let content):
                break
            case .downloadImages(let content):
                break
            }
        }

        override public func viewDidLayoutSubviews() {
            guard let webView: WKWebView = self.view as? WKWebView,
                  let account: UserInfo = account,
                  let token: JSONWebToken = try? JSONWebToken(gameWebToken: account.gameWebToken)
            else {
                return
            }
            self.observer = webView.observe(\.url, options: .new, changeHandler: { [self] _, _ in
                let currentTime: Date = Date()

                /// BulletTokenが有効期限切れ
                if account.expiration <= currentTime {
                    Task {
                        try await self.session.getBulletToken(sessionToken: account.sessionToken)
                        configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
                            webView.reload()
                        }
                        return
                    }
                }

                /// GameWebTokenが有効期限切れ
                if Date(timeIntervalSince1970: TimeInterval(token.payload.exp)) <= currentTime {
                    Task {
                        try await self.session.getBulletToken(sessionToken: account.sessionToken)
                        configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
                            webView.reload()
                        }
                        return
                    }
                }
            })
        }
    }
}
