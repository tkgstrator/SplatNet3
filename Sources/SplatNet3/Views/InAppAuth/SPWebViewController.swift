//
//  SPWebViewController.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

public class SPWebViewController: UIViewController, WKURLSchemeHandler {
    @StateObject var session: SP3Session = SP3Session()
    let state: String = String.randomString
    let verifier: String = String.randomString
    let contentId: ContentId

    public init(contentId: ContentId) {
        self.contentId = contentId
        super.init(nibName: nil, bundle: nil)
    }

    override public func viewDidLoad() {
        let configuration: WKWebViewConfiguration = WKWebViewConfiguration()
        configuration.setURLSchemeHandler(self, forURLScheme: "npf71b963c1b7b6d119")
        configuration.applicationNameForUserAgent = "SplatNet/@tkgling"
        let webView: SPWebView = SPWebView(frame: .zero, configuration: configuration)
        webView.load(URLRequest(url: URL(state: state, verifier: verifier)))
        self.view = webView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        guard let oauthURL: String = urlSchemeTask.request.url?.absoluteString,
              let code: String = oauthURL.capture(pattern: "de=(.*)&", group: 1)
        else {
            return
        }
        Task {
            let hosting: UIHostingController = UIHostingController(rootView: SignInView(code: code, verifier: verifier, contentId: contentId))
            hosting.isModalInPresentation = true
            hosting.modalTransitionStyle = .coverVertical
            hosting.modalPresentationStyle = .overFullScreen
            hosting.overrideUserInterfaceStyle = .dark
            hosting.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            present(hosting, animated: true)
        }
    }

    public func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
    }
}
