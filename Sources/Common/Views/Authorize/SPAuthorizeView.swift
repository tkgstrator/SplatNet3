//
//  SPAuthorizeView.swift
//  
//
//  Created by devonly on 2022/11/22.
//

import SwiftUI
import WebKit

public struct SPAuthorizeView: UIViewControllerRepresentable {
    typealias UIViewType = WKWebView
    typealias OnProcess = () -> Void
    typealias Completion = (Result<UserInfo, Error>) -> ()

    public init() {}
    
    public func makeUIViewController(context: Context) -> SPWebViewController {
        SPWebViewController()
    }

    public func updateUIViewController(_ uiViewController: SPWebViewController, context: Context) {
    }
}

struct SPAuthorizeView_Previews: PreviewProvider {
    @State private static var isPresented: Bool = false

    static var previews: some View {
        SPAuthorizeView()
    }
}
