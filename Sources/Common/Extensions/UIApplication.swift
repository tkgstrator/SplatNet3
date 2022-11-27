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
