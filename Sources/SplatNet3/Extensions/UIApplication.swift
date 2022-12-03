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

    private func findVisibleViewController(viewController: UIViewController) -> UIViewController {
        /// UINavigationController
        if let navigationController = viewController as? UINavigationController,
           let visibleController = navigationController.visibleViewController
        {
            return findVisibleViewController(viewController: visibleController)
        }

        /// UITabBarController
        if let tabBarController = viewController as? UITabBarController,
           let selectedTabController = tabBarController.selectedViewController
        {
            return findVisibleViewController(viewController: selectedTabController)
        }

        /// PresentedViewController
        if let presentedViewController = viewController.presentedViewController {
            return findVisibleViewController(viewController: presentedViewController)
        }

        return viewController
    }

    public func dismiss() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first(where: { $0.isKeyWindow })?.rootViewController
        {
            let visibleViewController = findVisibleViewController(viewController: rootViewController)
            visibleViewController.dismiss(animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    public func popover(_ viewControllerToPresent: UIActivityViewController, animated: Bool) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let popover = viewControllerToPresent.popoverPresentationController {
                popover.sourceView = viewControllerToPresent.view
                popover.barButtonItem = .none
                popover.sourceRect = viewControllerToPresent.accessibilityFrame
            }
        }
        present(viewControllerToPresent, animated: animated)
    }
}
