//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import SplatNet2
import SplatNet3
import SwiftyUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    private let session: SplatNet2 = SplatNet2()

    var body: some View {
        NavigationView(content: {
            Form(content: {
                Section(content: {
                    NavigationLink("Localized Message", destination: {
                        LocalizedMsgView()
                    })
                    NavigationLink("Localized Error", destination: {
                        LocalizedErrView()
                    })
                }, header: {
                    Text("Localized")
                })
                Section(content: {
                    ForEach(session.accounts, id: \.self) { account in
                        Text(account.nickname)
                    }
                }, header: {
                    Text("Accounts")
                })
                Section(content: {
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("Authorize")
                    })
                    .authorize(isPresented: $isPresented, session: session)
                }, header: {
                    Text("Authorization")
                })
            })
            .navigationTitle("SplatNet3 Demo")
        })
        .navigationViewStyle(.split)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
