//
//  SPWebViewController.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import WebKit
import UIKit
import SwiftUI

class SPWebViewController: UIViewController, WKURLSchemeHandler {
    let state: String = String.randomString
    let verifier: String = String.randomString

    init() {
        super.init(nibName: nil, bundle: nil)
        let configuration: WKWebViewConfiguration = WKWebViewConfiguration()
        configuration.setURLSchemeHandler(self, forURLScheme: "npf71b963c1b7b6d119")
        configuration.applicationNameForUserAgent = "SplatNet/@tkgling"
        self.view = SPWebView(state: state, verifier: verifier, configuration: configuration)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// URLSchemeを踏んだ時に実行される
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        guard let oauthURL: String = urlSchemeTask.request.url?.absoluteString,
              let code: String = oauthURL.capture(pattern: "de=(.*)&", group: 1)
        else {
            return
        }
        Task {
            let hosting: UIHostingController = UIHostingController(rootView: SignInView(code: code, verifier: verifier))
            hosting.isModalInPresentation = true
            hosting.modalTransitionStyle = .coverVertical
            hosting.modalPresentationStyle = .overFullScreen
            hosting.overrideUserInterfaceStyle = .dark
            hosting.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
            present(hosting, animated: true)
        }
    }

    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
    }
}
