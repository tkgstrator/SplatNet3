//
//  NavigationLinker.swift
//  Salmonia3+
//
//  Created by tkgstrator on 2022/09/17.
//

import SwiftUI

/// Form, Listで表示したときにIndicatorが表示されない
public struct NavigationLinker<Destination: View, Label: View>: View {
    let destination: () -> Destination
    let label: () -> Label

    public init(destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

    public var body: some View {
        ZStack(content: {
            NavigationLink(destination: destination(), label: {
                EmptyView()
            })
            .opacity(0.0)
            label()
        })
    }
}
