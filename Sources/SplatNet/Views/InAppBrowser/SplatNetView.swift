//
//  SwiftUIView.swift
//  
//
//  Created by devonly on 2022/11/28.
//  
//

import SwiftUI
import UIKit
import WebKit
import SDBridgeSwift

struct SplatNetView: UIViewControllerRepresentable {
    let contentId: ContentId

    init(contentId: ContentId) {
        self.contentId = contentId
    }

    func makeUIViewController(context: Context) -> WebViewController {
        WebViewController(contentId: contentId)
    }

    func updateUIViewController(_ uiViewController: WebViewController, context: Context) {
    }

    final class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
        private var bridge: WebViewJavascriptBridge
        private var observer: NSKeyValueObservation?
        private let session: SPSession = SPSession()
        private let contentId: ContentId
        private let configuration: WKWebViewConfiguration = WKWebViewConfiguration()

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let button = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
            /// イカリング3の場合はナビゲーションバーを表示しない
            self.parent?.navigationController?.setNavigationBarHidden(contentId == .SP3, animated: true)
            self.parent?.navigationItem.rightBarButtonItem = button
            self.parent?.navigationItem.rightBarButtonItem?.tintColor = .white
        }

        @objc func close() {
            dismiss(animated: true)
        }

        init(contentId: ContentId) {
            /// リクエスト
            var request: URLRequest = URLRequest(url: contentId.requestURL)
            self.contentId = contentId
            let webView: WKWebView = WKWebView(frame: .zero, configuration: configuration)
            self.bridge = WebViewJavascriptBridge(webView: webView)

            super.init(nibName: nil, bundle: nil)
            /// コンソールでデータを受け取ったらJavaScriptを実行する
            self.bridge.consolePipeClosure = { content in
                self.evaluateJavaScript(content)
            }

            // WebViewの見た目の変更
            webView.isOpaque = false
            webView.backgroundColor = UIColor(SPColor.SplatNet3.SPBackground)
            webView.uiDelegate = self
            webView.navigationDelegate = self

            /// どちらの場合でもX-GameWebTokenを利用してアクセスする
            if let account = session.account {
                switch contentId {
                case .SP2:
                    /// ヘッダーを更新
                    request.headers.add(name: "X-GameWebToken", value: account.gameWebToken)
                case .SP3:
                    /// クッキーを設定
                    let cookie = HTTPCookie(properties: [
                        HTTPCookiePropertyKey.name: "_gtoken",
                        HTTPCookiePropertyKey.value: account.gameWebToken,
                        HTTPCookiePropertyKey.domain: contentId.requestURL.host!,
                        HTTPCookiePropertyKey.path: "/"])!
                    webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie)
                }
            }
            webView.load(request)
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

        /// ビューが切り替わったときにトークンを再生成するかどうかをチェックする
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

extension View {
    /// イカリング2, イカリング3を開く
    public func openInAppBrowser(isPresented: Binding<Bool>, contentId: ContentId) -> some View {
        self.fullScreenCover(isPresented: isPresented, content: {
            NavigationView(content: {
                SplatNetView(contentId: contentId)
                    .preferredColorScheme(.dark)
                    .toolBarBackground()
            })
        })
    }

    /// ナビゲーションバーの色を変更する(iOS16以上のみ効く)
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
