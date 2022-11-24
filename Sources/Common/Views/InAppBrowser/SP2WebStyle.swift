//
//  SP3WebButton.swift
//
//
//  Created by devonly on 2022/11/23.
//

import SwiftUI

/// イカリング3ビューワを開く
public struct SP2WebButton<Content: View>: View {
    public typealias Label = () -> Content
    @State private var isPresented: Bool = false
    let label: Label
    let session: Authorize = Authorize()

    public init(label: @escaping Label) {
        self.label = label
    }

    public var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            label()
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            SP3WebView(account: session.account)
                .preferredColorScheme(.dark)
        })
    }
}
