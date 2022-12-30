//
//  UIApplication.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import UIKit
import SwiftUI

extension UIApplication {
    public var window: UIWindow? {
        UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first?.windows.first
    }

    public var rootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .compactMap({ $0 as? UIWindowScene })
            .first?
            .windows
            .first?
            .rootViewController
    }

    public var presentedViewController: UIViewController? {
        if let current = rootViewController?.presentedViewController {
            return current
        }
        return rootViewController
    }

    public func authorize(sessionToken: String, contentId: ContentId) {
        let hosting: UIHostingController = UIHostingController(rootView: _SignInView(sessionToken: sessionToken))
        hosting.modalPresentationStyle = .overFullScreen
        hosting.modalTransitionStyle = .coverVertical
        hosting.overrideUserInterfaceStyle = .dark
        hosting.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.presentedViewController?.present(hosting, animated: true)
        })
    }

    public func popToRootView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController,
           let navigationController = findNavigationController(rootViewController)
        {
            navigationController.popToRootViewController(animated: true)
        }
    }

    private func findNavigationController(_ viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(childViewController)
        }

        return nil
    }
}

extension UIViewController {
    public func popover(_ viewControllerToPresent: UIActivityViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popover = viewControllerToPresent.popoverPresentationController {
                popover.sourceView = viewControllerToPresent.view
                popover.barButtonItem = .none
                popover.sourceRect = viewControllerToPresent.accessibilityFrame
            }
        }
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
}

