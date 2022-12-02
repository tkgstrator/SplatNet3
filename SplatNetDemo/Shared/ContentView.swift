//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI

3
import RealmSwift

struct ContentView: View {
    @ObservedResults(RealmCoopResult.self) var results

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
                FileExportButton()
                Button(action: {
                    Task {
                        await RealmService.shared.deleteAll()
                    }
                }, label: {
                    Text("Delete All")
                })
                NavigationLink(destination: {
                    RequestView()
                }, label: {
                    Text("RequestView")
                })
                HStack(content: {
                    Text("リザルト件数")
                    Spacer()
                    Text("\(results.count)")
                })
            })
            .navigationTitle("SplatNet3 Demo")
        })
    }
}

struct FileExportButton: View {
    @State private var isPresented: Bool = false

    var body: some View {
        Button(action: {
            Task {
                let path: URL = try await RealmService.shared.exports()
                let controller: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
                UIApplication.shared.rootViewController?.popover(controller, animated: true)
            }
        }, label: {
            Text("Export")
        })
    }
}

struct RequestView: View {
    @StateObject var session: Session = Session()

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
    @State private var isPresented: Bool = false
    let session: Session
    let hash: SHA256Hash

    var body: some View {
        Button(action: {
            Task {
                switch hash {
                case .CoopHistoryDetailQuery:
                    isPresented.toggle()
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
            })
            .fullScreen(isPresented: $isPresented, session: session)
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
            FilePickerView(fileType: .json, onSelected: { url in
                Task {
                    try await RealmService.shared.imports(contentsOf: url)
                }
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
