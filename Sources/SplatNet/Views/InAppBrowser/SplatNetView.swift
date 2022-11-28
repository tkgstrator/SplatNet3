//
//  SwiftUIView.swift
//  
//
//  Created by Shota Morimoto on 2022/11/28.
//  
//

import SwiftUI
import UIKit
import WebKit
import SDBridgeSwift

public struct SplatNetView: UIViewControllerRepresentable {
    let contentId: ContentId

    public init(contentId: ContentId) {
        self.contentId = contentId
    }

    public func makeUIViewController(context: Context) -> WebViewController {
        WebViewController(contentId: contentId)
    }

    public func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
    }

    public final class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
        private var bridge: WebViewJavascriptBridge
        private var observer: NSKeyValueObservation?
        private let session: SPSession = SPSession()
        private let contentId: ContentId
        private let configuration: WKWebViewConfiguration = WKWebViewConfiguration()
//        private var cookie: HTTPCookie {
////            guard let gtoken: String = account?.gameWebToken else {
////                return HTTPCookie()
////            }
//
//            return HTTPCookie(properties: [
//                HTTPCookiePropertyKey.name: "_gtoken",
//                HTTPCookiePropertyKey.value: gtoken,
//                HTTPCookiePropertyKey.domain: URL(string: "https://api.lp1.av5ja.srv.nintendo.net/")!.host!,
//                HTTPCookiePropertyKey.path: "/"])!
//        }

        override public func viewDidLoad() {
            super.viewDidLoad()
        }

        override public func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.parent?.navigationController?.navigationBar.backgroundColor = .red
            self.parent?.navigationController?.navigationBar.barTintColor = .red
            self.parent?.navigationController?.navigationBar.tintColor = .red
        }

        override public func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let button = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
            self.parent?.navigationController?.setNavigationBarHidden(contentId == .SP3, animated: true)
            self.parent?.navigationItem.rightBarButtonItem = button
            self.parent?.navigationItem.rightBarButtonItem?.tintColor = .white
        }

        @objc func close() {
            dismiss(animated: true)
        }

        init(contentId: ContentId) {
            /// URLを設定
            var request: URLRequest = URLRequest(url: contentId.requestURL)
            self.contentId = contentId
            let webView: WKWebView = WKWebView(frame: .zero, configuration: configuration)
            self.bridge = WebViewJavascriptBridge(webView: webView)

            super.init(nibName: nil, bundle: nil)
            self.bridge.consolePipeClosure = { content in
                self.evaluateJavaScript(content)
            }

            // WebViewの見た目の変更
            webView.isOpaque = false
            webView.backgroundColor = UIColor(SPColor.SplatNet3.SPBackground)
            webView.uiDelegate = self
            webView.navigationDelegate = self
            self.view = webView

            if let account = session.account {
                switch contentId {
                case .SP2:
                    request.headers.add(name: "X-GameWebToken", value: account.gameWebToken)
                case .SP3:
                    let cookie = HTTPCookie(properties: [
                        HTTPCookiePropertyKey.name: "_gtoken",
                        HTTPCookiePropertyKey.value: account.gameWebToken,
                        HTTPCookiePropertyKey.domain: contentId.requestURL.host!,
                        HTTPCookiePropertyKey.path: "/"])!
                    webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                }
            }
            webView.load(request)
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
//            guard let webView: WKWebView = self.view as? WKWebView,
//                  let account: UserInfo = account,
//                  let token: JSONWebToken = try? JSONWebToken(gameWebToken: account.gameWebToken)
//            else {
//                return
//            }
//            self.observer = webView.observe(\.url, options: .new, changeHandler: { [self] _, _ in
//                let currentTime: Date = Date()
//
//                /// BulletTokenが有効期限切れ
//                if account.expiration <= currentTime {
//                    Task {
//                        try await self.session.getBulletToken(sessionToken: account.sessionToken)
//                        configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
//                            webView.reload()
//                        }
//                        return
//                    }
//                }
//
//                /// GameWebTokenが有効期限切れ
//                if Date(timeIntervalSince1970: TimeInterval(token.payload.exp)) <= currentTime {
//                    Task {
//                        try await self.session.getBulletToken(sessionToken: account.sessionToken)
//                        configuration.websiteDataStore.httpCookieStore.setCookie(cookie) {
//                            webView.reload()
//                        }
//                        return
//                    }
//                }
//            })
        }
    }
}

struct SplatNetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            SplatNetView(contentId: .SP3)
                .preferredColorScheme(.dark)
        })
    }
}

public extension View {
    func openInAppBrowser(isPresented: Binding<Bool>, contentId: ContentId) -> some View {
        self.fullScreenCover(isPresented: isPresented, content: {
            NavigationView(content: {
                SplatNetView(contentId: contentId)
                    .preferredColorScheme(.dark)
                    .toolBarBackground()
            })
        })
    }

    func toolBarBackground() -> some View {
        if #available(iOS 16.0, *) {
            return self
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.red, for: .navigationBar)
        } else {
            return self
        }
    }
}
