//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import Common

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            Form(content: {
                SPAuthButton(
                    onSuccess: {},
                    label: {
                        Text("Sign In")
                    })
                SP3WebButton(label: {
                    Text("SplatNet3")
                })
                FilePickerButton()
            })
            .navigationTitle("SplatNet3 Demo")
        })
    }
}

struct FilePickerButton: View {
    @State private var isPresented: Bool = false

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Import")
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            FilePickerView(fileType: .json, onSelected: { _ in
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
