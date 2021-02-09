//
//  UILayoutPriority+Convenience.swift
//  APLayoutKit
//
//  Created by Vladyslav Sosiuk on 09.02.2021.
//

import UIKit

extension UILayoutPriority {
    static let nonRequired: UILayoutPriority = 999
}

extension UILayoutPriority: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: Int) {
        self.init(rawValue: Float(value))
    }
}
