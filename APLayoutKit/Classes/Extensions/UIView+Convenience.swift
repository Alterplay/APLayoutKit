//
//  UIView+Convenience.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

public extension UIView {
    @discardableResult
    func addSubview<ViewType: UIView>(_ subview: ViewType,
                                      pin: LayoutPins = [],
                                      configure: ((ViewType) -> Void)? = nil) -> ViewType {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        self.pin(toView: subview, pin: pin)
        configure?(subview)
        return subview
    }
    
}

public extension UIStackView {
    @discardableResult
    func addArrangedSubview<ViewType: UIView>(_ subview: ViewType,
                                      configure: ((ViewType) -> Void)? = nil) -> ViewType {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(subview)
        configure?(subview)
        return subview
    }
}
