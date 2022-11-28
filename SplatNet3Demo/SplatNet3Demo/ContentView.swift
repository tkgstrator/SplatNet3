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
            ForEach(ContentId.allCases, content: { contentId in
                Section(content: {
                    InAppBrower(contentId: contentId)
                    ForEach(AuthType.allCases, content: { authType in
                        OAuthButton(contentId: contentId, authType: authType)
                    })
                }, header: {
                    Text(String(describing: contentId))
                })
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
    let authType: AuthType

    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("OAuth")
        })
        .authorize(isPresented: $isPresented, contentId: contentId, using: authType)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
