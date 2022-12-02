//
//  SignInView.swift
//  SplatNet3
//
//  Created by tkgstrator on 2021/07/13.
//  Copyright © 2021 Magi, Corporation. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct SignInView: View {
    @StateObject var session: SPSession = SPSession()
    @Environment(\.dismiss) var dismiss
    let code: String
    let verifier: String
    let contentId: ContentId

    func makeBody(request: SPProgress) -> some View {
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
                        .foregroundColor(.white)
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
                do {
//                    try await session.getCookie(code: code, verifier: verifier, contentId: contentId)
//                    try await session.getCookie(code: code, verifier: verifier)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        /// コレ自体が消えるとちょっと問題があるかも
                        UIApplication.shared.rootViewController?.dismiss(animated: true)
                    })
                } catch(let error) {
                    print(error)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        dismiss()
//                        UIApplication.shared.rootViewController?.dismiss(animated: true)
                    })
                }
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
    static let session: SPSession = SPSession()
    static var previews: some View {
        SignInView(code: "", verifier: "", contentId: .SP3)
    }
}

