//
//  RetrieveView.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import SwiftUI
import SplatNet

struct RetrieveView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var session: SPSession

    func makeBody(request: SPProgress) -> some View {
        switch request.progress {
        case .PROGRESS:
            return ProgressView()
                .frame(width: 24, height: 24, alignment: .center)
                .opacity(1.0)
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
            //            ProgressView("", value: session.current, total: session.maximum == .zero ? 1 : session.maximum)
        })
        .frame(width: 320)
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
        .background(SPColor.SplatNet3.SPBackground.cornerRadius(12))
        .animation(.default, value: session.requests.count)
        .onAppear(perform: {
            Task {
                do {
                    //                    let results: [CoopResult] = try await session.getAllCoopHistoryDetailQuery()
                    //                    dump(results)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        //                        isPresented.toggle()
                        //                        dismiss()
                    })
                } catch {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        //                        isPresented.toggle()
                        //                        dismiss()
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

//    public func fullScreen(isPresented: Binding<Bool>, session: SPSession) -> some View {
//        self.fullScreen(isPresented: isPresented, content: {
//            RetrieveView(session: session)
//        })
//    }
}

//struct RetrieveViews: PreviewProvider {
//    static var previews: some View {
//        RetrieveView()
//    }
//}
