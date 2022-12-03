//
//  WKWebView.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

class SPWebView: WKWebView, WKNavigationDelegate {
    let indicator: UIActivityIndicatorView = {
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(SPColor.SplatNet3.SPOrange)
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()

    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        self.isOpaque = false
        self.backgroundColor = .clear
        self.allowsLinkPreview = false
        self.navigationDelegate = self
        self.scrollView.alwaysBounceVertical = false
        self.addSubview(indicator)
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
