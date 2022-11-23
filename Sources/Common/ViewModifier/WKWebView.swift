//
//  WKWebView.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import Foundation
import WebKit
import SwiftUI
import UIKit

class SPWebView: WKWebView, WKNavigationDelegate {
    let indicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(SPColor.SplatNet3.SPOrange)
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()

    init(coordinator: SPAuthorizeView.Coordinator) {
        let preferences: WKPreferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true

        let processPool: WKProcessPool = WKProcessPool()

        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        config.processPool = processPool
        config.setURLSchemeHandler(coordinator, forURLScheme: "npf71b963c1b7b6d119")
        config.applicationNameForUserAgent = "SplatNet/@tkgling"
        super.init(frame: .zero, configuration: config)
        self.isOpaque = false
        self.backgroundColor = .clear
        self.allowsLinkPreview = false
        self.navigationDelegate = self
        self.scrollView.alwaysBounceVertical = false

        let request: URLRequest = URLRequest(url: URL(state: coordinator.state, verifier: coordinator.verifier))
        self.addSubview(indicator)
        self.load(request)
    }

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        indicator.center = self.center
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
