//
//  FullScreen.swift
//
//
//  Created by devonly on 2022/11/23.
//

import SwiftUI

struct FullScreen<Content: View>: UIViewControllerRepresentable {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPresented: Bool
    let content: Content
    let transitionStyle: UIModalTransitionStyle
    let presentationStyle: UIModalPresentationStyle
    let isModalInPresentation: Bool
    let backgroundColor: UIColor

    init(isPresented: Binding<Bool>,
         presentationStyle: UIModalPresentationStyle? = nil,
         transitionStyle: UIModalTransitionStyle? = nil,
         isModalInPresentation: Bool = true,
         backgroundColor: Color = Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)),
         content: Content
    ) {
        self.content = content
        self.transitionStyle = transitionStyle ?? .coverVertical
        self.presentationStyle = presentationStyle ?? .overFullScreen
        self.isModalInPresentation = isModalInPresentation
        self.backgroundColor = UIColor(backgroundColor)
        self._isPresented = isPresented
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> ViewController<Content> {
        return ViewController(
            coordinator: context.coordinator,
            transitionStyle: transitionStyle,
            presentationStyle: presentationStyle,
            isModalInPresentation: isModalInPresentation,
            backgroundColor: backgroundColor,
            colorScheme: .dark,
            content: content
        )
    }

    func updateUIViewController(
        _ uiViewController: ViewController<Content>,
        context: Context
    ) {
        context.coordinator.parent = self
        uiViewController.parent?.presentationController?.delegate = context.coordinator

        switch isPresented {
        case true:
            uiViewController.present()
        case false:
            break
//            uiViewController.dismiss()
        }
    }

    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var parent: FullScreen

        init(_ parent: FullScreen) {
            self.parent = parent
        }

        // 画面外タップでViewをとじたときに呼ばれる
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            if parent.isPresented {
                parent.isPresented = false
            }
        }
    }

    final class HostingController<Content: View>: UIHostingController<Content> {
        init(content: Content) {
            super.init(rootView: content)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    // This custom view controller
    final class ViewController<Content: View>: UIViewController, UIGestureRecognizerDelegate {
        let coordinator: FullScreen<Content>.Coordinator
        let hosting: UIHostingController<Content>
        let transitionStyle: UIModalTransitionStyle
        let presentationStyle: UIModalPresentationStyle
        let backgroundColor: UIColor
        let userInterfaceStyle: UIUserInterfaceStyle

        init(coordinator: FullScreen<Content>.Coordinator,
             transitionStyle: UIModalTransitionStyle,
             presentationStyle: UIModalPresentationStyle,
             isModalInPresentation: Bool,
             backgroundColor: UIColor,
             colorScheme: UIUserInterfaceStyle,
             content: Content
        ) {
            self.coordinator = coordinator
            self.hosting = UIHostingController(rootView: content)
            self.transitionStyle = transitionStyle
            self.presentationStyle = presentationStyle
            self.backgroundColor = backgroundColor
            self.userInterfaceStyle = colorScheme
            super.init(nibName: nil, bundle: .main)
            self.overrideUserInterfaceStyle = colorScheme
            self.isModalInPresentation = isModalInPresentation
        }

        @objc func tapped(sender: UITapGestureRecognizer) {
            coordinator.parent.isPresented.toggle()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
            if coordinator.parent.isPresented {
                coordinator.parent.isPresented.toggle()
            }
            super.dismiss(animated: flag, completion: completion)
        }

        // 表示
        func present() {
            // Hostingの設定
            hosting.isModalInPresentation = isModalInPresentation
            hosting.modalPresentationStyle = presentationStyle
            hosting.modalTransitionStyle = transitionStyle
            hosting.view.backgroundColor = backgroundColor
            hosting.overrideUserInterfaceStyle = userInterfaceStyle
            hosting.presentationController?.delegate = coordinator as UIAdaptivePresentationControllerDelegate

            if !self.isModalInPresentation {
                // 個別の設定
                let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
                gesture.delegate = self
                hosting.view.addGestureRecognizer(gesture)
            }

            if let _ = presentedViewController?.isBeingPresented {} else {
                present(hosting, animated: true, completion: nil)
            }
        }

        // 表示されているViewがあるときだけとじる
        func dismiss() {
            dismiss(animated: true, completion: nil)
        }
    }
}


private extension ColorScheme {
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
