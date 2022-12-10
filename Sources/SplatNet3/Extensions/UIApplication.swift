//
//  UIApplication.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import UIKit

extension UIApplication {
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
