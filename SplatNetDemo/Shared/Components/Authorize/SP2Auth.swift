//
//  SP2Auth.swift
//  SplatNetDemo (iOS)
//
//  Created by devonly on 2022/09/12.
//

import SwiftUI
import SplatNet2

struct SP2Auth: View {
    @State private var isPresented: Bool = false
    let session: SplatNet2

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Authorize")
        })
        .authorize(isPresented: $isPresented, session: session)
    }
}

struct SP2Auth_Previews: PreviewProvider {
    static let session: SplatNet2 = SplatNet2()
    static var previews: some View {
        SP2Auth(session: session)
    }
}
