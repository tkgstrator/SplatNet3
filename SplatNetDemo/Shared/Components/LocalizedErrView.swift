//
//  LocalizedErrView.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/08/28.
//

import SwiftUI
import Common

struct LocalizedErrView: View {
    var body: some View {
        Form(content: {
            Section(content: {
                ForEach(NXError.NSO.allCases, id: \.self) { error in
                    RequestButton(localizedError: error)
                }
            }, header: {
                Text("NSO")
            })
            Section(content: {
                ForEach(NXError.APP.allCases, id: \.self) { error in
                    RequestButton(localizedError: error)
                }
            }, header: {
                Text("APP")
            })
            Section(content: {
                ForEach(NXError.API.allCases, id: \.self) { error in
                    RequestButton(localizedError: error)
                }
            }, header: {
                Text("API")
            })
        })
        .navigationTitle("Errors")
    }
}

struct LocalizedErrView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedErrView()
    }
}
