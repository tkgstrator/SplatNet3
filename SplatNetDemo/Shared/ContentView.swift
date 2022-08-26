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
    @State private var visibility = NavigationSplitViewVisibility.all

    var body: some View {
        NavigationView(content: {
            Form(content: {
            })
        })
        .navigationViewStyle(.split)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
