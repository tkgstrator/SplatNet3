//
//  RequestButton.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/08/28.
//

import SwiftUI
import SplatNet2

struct RequestButton<T: SP2Error>: View {
    @State private var isPresented: Bool = false
    let localizedError: T

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text(localizedError.rawValue)
        })
        .alert("", isPresented: $isPresented, actions: {}, message: {
            Text(localizedError.errorMessage)
        })
    }
}

struct RequestButton_Previews: PreviewProvider {
    static let localizedError: NXError.APP = NXError.APP.version
    static var previews: some View {
        RequestButton(localizedError: localizedError)
    }
}
