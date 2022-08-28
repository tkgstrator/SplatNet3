//
//  LocalizedMsgView.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/08/28.
//

import SwiftUI
import SplatNet2

struct LocalizedMsgView: View {
    var body: some View {
        Form(content: {
            Section(content: {
                ForEach(GradeKey.allCases, id: \.self) { gradeKey in
                    Text(gradeKey.localized)
                }
            }, header: {
                Text("Grade")
            })
            Section(content: {
                ForEach(BossKey.allCases, id: \.self) { bossKey in
                    Text(bossKey.localized)
                }
            }, header: {
                Text("Boss")
            })
            Section(content: {
                ForEach(WaterKey.allCases, id: \.self) { waterKey in
                    Text(waterKey.localized)
                }
            }, header: {
                Text("WaterLevel")
            })
            Section(content: {
                ForEach(EventKey.allCases, id: \.self) { eventKey in
                    Text(eventKey.localized)
                }
            }, header: {
                Text("EventType")
            })
        })
    }
}

struct LocalizedMsgView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedMsgView()
    }
}
