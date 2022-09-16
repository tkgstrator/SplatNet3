//
//  LocalizedMsgView.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/08/28.
//

import SwiftUI
import SplatNet3

struct LocalizedMsgView: View {
    var body: some View {
        Form(content: {
            Section(content: {
                ForEach(StageType.allCases, id: \.self) { stage in
                    Text(stage.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Stage")
            })
            Section(content: {
                ForEach(GradeType.allCases, id: \.self) { grade in
                    Text(grade.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Grade")
            })
            Section(content: {
                ForEach(EventType.allCases, id: \.self) { event in
                    Text(event.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Event")
            })
            Section(content: {
                ForEach(WaterType.allCases, id: \.self) { water in
                    Text(water.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Water")
            })
            Section(content: {
                ForEach(WeaponType.allCases, id: \.self) { weapon in
                    Text(weapon.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Weapon")
            })
            Section(content: {
                ForEach(SpecialType.allCases, id: \.self) { special in
                    Text(special.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Special")
            })
            Section(content: {
                ForEach(SakelienType.allCases, id: \.self) { sakelien in
                    Text(sakelien.localizedText)
                        .lineLimit(1)
                }
            }, header: {
                Text("Sakelien")
            })
        })
        .navigationTitle("Messages")
    }
}

struct LocalizedMsgView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedMsgView()
    }
}
