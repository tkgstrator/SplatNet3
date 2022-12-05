//
//  RetrieveView.swift
//  
//
//  Created by devonly on 2022/11/26.
//

import SwiftUI


struct RetrieveView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    @State private var value: Float = .zero
    @State private var total: Float = 1
    @StateObject var session: SP3Session

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
            ProgressView("", value: value, total: total)
        })
        .frame(width: 320)
        .padding(EdgeInsets(top: 20, leading: 12, bottom: 20, trailing: 12))
        .background(SPColor.SplatNet3.SPBackground.cornerRadius(12))
        .animation(.default, value: session.requests.count)
        .onDisappear(perform: {
            self.session.requests.removeAll()
        })
        .onAppear(perform: {
            withAnimation(.none) {
                self.total = 1
                self.value = 0
            }
            Task {
                do {
                    try await session.getCoopStageScheduleQuery()
                    try await session.getAllCoopHistoryDetailQuery(completion: { value, total in
                        withAnimation(.default) {
                            self.value = value
                            self.total = total
                        }
                    })
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        isPresented.toggle()
                    })
                } catch(let error) {
                    SwiftyLogger.error(error.localizedDescription)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        isPresented.toggle()
                    })
                }
            }
        })
    }
}

extension View {
    public func fullScreen(isPresented: Binding<Bool>, session: SP3Session) -> some View {
        self.fullScreen(isPresented: isPresented, content: {
            RetrieveView(isPresented: isPresented, session: session)
        })
    }
}

//struct RetrieveViews: PreviewProvider {
//    static var previews: some View {
//        RetrieveView()
//    }
//}
