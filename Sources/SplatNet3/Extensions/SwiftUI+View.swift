//
//  SwiftUI+View.swift
//  
//
//  Created by devonly on 2022/12/03.
//

import Foundation
import SwiftUI

public extension View {
    func asAnyView() -> AnyView {
        AnyView(self)
    }
}
