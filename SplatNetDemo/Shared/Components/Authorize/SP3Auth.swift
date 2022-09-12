//
//  SP3Auth.swift
//  SplatNetDemo (iOS)
//
//  Created by devonly on 2022/09/12.
//

import SwiftUI
import SplatNet3

struct SP3Auth: View {
    @State private var isPresented: Bool = false
    let session: SplatNet3

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Authorize")
        })
        .authorize(isPresented: $isPresented, session: session)
    }
}

struct SP3Auth_Previews: PreviewProvider {
    static let session: SplatNet3 = SplatNet3()
    static var previews: some View {
        SP3Auth(session: session)
    }
}
