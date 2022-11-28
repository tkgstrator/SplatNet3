//
//  OAuthView.swift
//
//
//  Created by devonly on 2022/11/22.
//

import SwiftUI
import WebKit

public struct OAuthView: UIViewControllerRepresentable {
    typealias UIViewType = WKWebView
    let contentId: ContentId

    public init(contentId: ContentId) {
        self.contentId = contentId
    }

    public func makeUIViewController(context: Context) -> SPWebViewController {
        SPWebViewController(contentId: contentId)
    }

    public func updateUIViewController(_ uiViewController: SPWebViewController, context: Context) {
    }
}

struct SPAuthorizeView_Previews: PreviewProvider {
    static var previews: some View {
        OAuthView(contentId: .SP3)
    }
}

extension View {
    public func authorize(isPresented: Binding<Bool>, contentId: ContentId) -> some View {
        self.sheet(isPresented: isPresented, content: {
            OAuthView(contentId: contentId)
        })
    }
}
