//
//  UIApplication.swift
//  
//
//  Created by devonly on 2022/11/23.
//

import Foundation
import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .compactMap({ $0 as? UIWindowScene })
            .first?
            .windows
            .first?
            .rootViewController
    }
}
