//
//  SignInView.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import SwiftUI

struct SignInView: View {
    let requests: [Progress] = []

    var body: some View {
        VStack(content: {
            ForEach(requests, content: { request in
                HStack(content: {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 60, height: 24, alignment: .center)
                        .foregroundColor(request.color)
                        .overlay(content: {
                            Text(request.type.rawValue)
                                .foregroundColor(.white)
                        })
                    Text(request.path.rawValue)
                        .frame(width: 220, height: nil, alignment: .leading)
                        .lineLimit(1)
                })
            })
            Text("Nyamo")
        })
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
        .animation(.default, value: requests.count)
    }
}
