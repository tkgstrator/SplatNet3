//
//  SignInView.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import UIKit
import SwiftUI

struct SignInView: View {
    @StateObject var session: SPSession = SPSession()
    let code: String
    let verifier: String

    func makeBody(request: Progress) -> some View {
        switch request.progress {
        case .PROGRESS:
            return ProgressView()
                .frame(width: 24, height: 24, alignment: .center)
                .asAnyView()
        case .SUCCESS:
            return Image(systemName: "checkmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .frame(width: 24, height: 24, alignment: .center)
                .asAnyView()
        case .FAILURE:
            return Image(systemName: "xmark.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 24, height: 24, alignment: .center)
                .asAnyView()
        }
    }

    var body: some View {
        VStack(content: {
            ForEach(session.requests, content: { request in
                HStack(content: {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 60, height: 24, alignment: .center)
                        .foregroundColor(request.color)
                        .overlay(content: {
                            Text(request.type.rawValue)
                                .foregroundColor(.white)
                                .bold()
                                .font(.body)
                        })
                    Text(request.path.rawValue)
                        .font(.body)
                        .frame(width: 220, height: nil, alignment: .leading)
                        .lineLimit(1)
                    makeBody(request: request)
                })
            })
        })
        .frame(width: 320)
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
        .background(SPColor.SplatNet3.SPBackground.cornerRadius(12))
        .animation(.default, value: session.requests.count)
        .onAppear(perform: {
            Task {
                try await session.getBulletToken(code: code, verifier: verifier)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    /// コレ自体が消えるとちょっと問題があるかも
                    UIApplication.shared.rootViewController?.dismiss(animated: true)
                })
            }
        })
    }
}

extension View {
    func asAnyView() -> AnyView {
        AnyView(self)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(code: "", verifier: "")
    }
}

