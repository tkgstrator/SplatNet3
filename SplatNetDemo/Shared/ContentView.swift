//
//  ContentView.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import SwiftyUI
import SplatNet2
import SplatNet3

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            Form(content: {
                NavigationLink(destination: {
                    List(content: {
                        ForEach(EventType.allCases, id: \.self) { eventId in
                            Text(eventId.localizedText)
                        }
                    })
                    .navigationTitle("EventType")
                }, label: {
                    Text("EventType")
                })
                NavigationLink(destination: {
                    List(content: {
                        ForEach(WaterType.allCases, id: \.self) { waterId in
                            Text(waterId.localizedText)
                        }
                    })
                    .navigationTitle("WaterType")
                }, label: {
                    Text("WaterType")
                })
                NavigationLink(destination: {
                    List(content: {
                        ForEach(SakelienType.allCases, id: \.self) { sakelienId in
                            Text(sakelienId.localizedText)
                        }
                    })
                    .navigationTitle("SakelienType")
                }, label: {
                    Text("SakelienType")
                })
                NavigationLink(destination: {
                    List(content: {
                        ForEach(GradeType.allCases, id: \.self) { gradeId in
                            Text(gradeId.localizedText)
                        }
                    })
                    .navigationTitle("GradeType")
                }, label: {
                    Text("GradeType")
                })
                NavigationLink(destination: {
                    List(content: {
                        ForEach(StageType.allCases, id: \.self) { stageId in
                            Text(stageId.localizedText)
                        }
                    })
                    .navigationTitle("StageType")
                }, label: {
                    Text("StageType")
                })
            })
            .navigationTitle("SplatNet3 Demo")
        })
        .navigationViewStyle(.split)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
