//
//  ContentView.swift
//  SplatNet3Demo
//
//  Created by tkgstrator on 2022/11/28.
//  
//

import SwiftUI
import SplatNet
import SplatNet3

struct ContentView: View {
    var body: some View {
        Form(content: {
            Section(content: {
                OAuthButton(contentId: .SP2)
                InAppBrower(contentId: .SP2)
            }, header: {
                Text("SP2")
            })
            Section(content: {
                OAuthButton(contentId: .SP3)
                InAppBrower(contentId: .SP3)
            }, header: {
                Text("SP3")
            })
        })
    }
}

struct InAppBrower: View {
    @State private var isPresented: Bool = false
    let contentId: ContentId

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("In App Brower")
        })
        .openInAppBrowser(isPresented: $isPresented, contentId: contentId)
    }
}

struct OAuthButton: View {
    @State private var isPresented: Bool = false
    let contentId: ContentId

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("OAuth")
        })
        .authorize(isPresented: $isPresented, contentId: contentId)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
