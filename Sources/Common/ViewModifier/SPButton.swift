//
//  Authorize.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import SwiftUI

public struct SPButton<Content: View>: View {
    public typealias Completion = (() -> Void)
    @State private var isPresented: Bool = false
    let onSuccess: Completion
    let label: () -> Content

    /// ログイン成功時に処理を実行
    public init(
        onSuccess: @escaping Completion,
        label: @escaping () -> Content
    ) {
        self.onSuccess = onSuccess
        self.label = label
    }

    /// ログイン成功時に何もしない
    public init(
        label: @escaping () -> Content
    ) {
        self.onSuccess = {}
        self.label = label
    }

    public var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            label()
        })
        .sheet(isPresented: $isPresented, content: {
            SPAuthorizeView(completion: { result in
                isPresented.toggle()
                switch result {
                case .success(let account):
                    dump(account)
                    onSuccess()
                case .failure(let error):
                    print(error)
                }
            })
        })
    }
}
