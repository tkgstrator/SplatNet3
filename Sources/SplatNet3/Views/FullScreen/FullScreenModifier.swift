//
//  FullScreenModifier.swift
//
//
//  Created by devonly on 2022/11/23.
//

import SwiftUI

public extension View {
    /// モーダルをUIKit風に表示する
    func fullScreen<Content: View>(
        isPresented: Binding<Bool>,
        content: @escaping () -> Content
    ) -> some View {
        self.overlay(
            FullScreen(
                isPresented: isPresented,
                content: content())
            .frame(width: 0, height: 0)
        )
    }

    func fullScreen<Content: View>(
        isPresented: Binding<Bool>,
        presentationStyle: UIModalPresentationStyle? = nil,
        transitionStyle: UIModalTransitionStyle? = nil,
        backgroundColor: Color = Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)),
        isModalInPresentation: Bool = true,
        content: @escaping () -> Content
    ) -> some View {
        self.overlay(
            FullScreen(
                isPresented: isPresented,
                presentationStyle: presentationStyle,
                transitionStyle: transitionStyle,
                isModalInPresentation: isModalInPresentation,
                backgroundColor: backgroundColor,
                content: content())
            .frame(width: 0, height: 0)
        )
    }
}
