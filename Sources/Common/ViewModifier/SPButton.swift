//
//  Authorize.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import SwiftUI

public struct SPButton<Content: View>: View {
    @State private var isPresented: Bool = false
    let label: () -> Content

    public init(label: @escaping () -> Content) {
        self.label = label
    }

    public var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            label()
        })
        .sheet(isPresented: $isPresented, content: {
            SPAuthorizeView()
        })
    }
}
