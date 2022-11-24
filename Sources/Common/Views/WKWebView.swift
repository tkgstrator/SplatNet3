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

    init(state: String, verifier: String, configuration: WKWebViewConfiguration) {
        super.init(frame: .zero, configuration: configuration)
        self.isOpaque = false
        self.backgroundColor = .clear
        self.allowsLinkPreview = false
        self.navigationDelegate = self
        self.scrollView.alwaysBounceVertical = false

        let request: URLRequest = URLRequest(url: URL(state: state, verifier: verifier))
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
