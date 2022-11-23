//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import Common

struct ContentView: View {
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView(content: {
            Form(content: {
                SPButton(
                    onSuccess: {},
                    label: {
                        Text("Sign In")
                    })
            })
            .navigationTitle("SplatNet3 Demo")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
