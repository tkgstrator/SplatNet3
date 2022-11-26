//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import Common
import SplatNet3

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
                NavigationLink(destination: {
                    RequestView()
                }, label: {
                    Text("RequestView")
                })
            })
            .navigationTitle("SplatNet3 Demo")
        })
    }
}

struct RequestView: View {
    @StateObject var session: SplatNet3 = SplatNet3()

    var body: some View {
        List(content: {
            ForEach(SHA256Hash.allCases, content: { hash in
                switch hash {
                case .CoopHistoryQuery, .CoopHistoryDetailQuery, .FriendListQuery, .StageScheduleQuery:
                    RequestButton(session: session, hash: hash)
                default:
                    EmptyView()
                }
            })
        })
        .listStyle(.plain)
        .navigationTitle("Request Demo")
    }
}

struct RequestButton: View {
    @State private var isPresented: Bool = true
    let session: SplatNet3
    let hash: SHA256Hash

    var body: some View {
        Button(action: {
            Task {
                switch hash {
                case .CoopHistoryDetailQuery:
                    let response = try await session.getAllCoopHistoryDetailQuery()
                    dump(response.count)
                case .CoopHistoryQuery:
                    let response = try await session.getCoopHistoryQuery()
                    dump(response)
                case .FriendListQuery:
                    let response = try await session.getFriendListQuery()
                    dump(response)
                case .StageScheduleQuery:
                    let response = try await session.getCoopStageScheduleQuery()
                    dump(response)
                default:
                    break
                }
            }
        }, label: {
            HStack(content: {
                Text(String(describing: hash))
                    .lineLimit(1)
                Spacer()
                Image(systemName: isPresented ? "questionmark.circle" : "checkmark.circle")
                    .foregroundColor(isPresented ? .red : .green)
            })
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
