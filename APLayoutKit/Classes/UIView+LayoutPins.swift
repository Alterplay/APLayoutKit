//
//  UIView+LayoutPins.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

extension UIView {
    
    @discardableResult
    public func pinSubview(_ subview: UIView, pin: LayoutPins, toSafeAreaLayoutGuide: Bool = false) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        switch pin {
        case .safeArea(let pins):
            constraints.append(contentsOf: pinSubview(subview, pin: pins, toSafeAreaLayoutGuide: true))
        case .aggregate(let pins):
            pins.forEach { constraints.append(contentsOf: pinSubview(subview, pin: $0, toSafeAreaLayoutGuide: toSafeAreaLayoutGuide)) }
        case .relative(let attribute,
                       let relatedBy,
                       let to,
                       let multiplier,
                       let constant):
            constraints.append(NSLayoutConstraint(item: toSafeAreaLayoutGuide ? safeAreaLayoutGuide : self,
                                                  attribute: attribute,
                                                  relatedBy: relatedBy,
                                                  toItem: subview,
                                                  attribute: to,
                                                  multiplier: multiplier,
                                                  constant: constant))
        case .fixed,
             .width,
             .height:
            constraints = subview.pin(to: pin)
        }
        return activate(constraints: constraints)
    }
    
    @discardableResult
    public func pin(to pin: LayoutPins) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        switch pin {
        case .safeArea:
            assert(true, "for safeArea pin please use pinSubview method")
        case .aggregate(let pins):
            pins.forEach{ constraints.append(contentsOf: self.pin(to: $0)) }
        case .relative:
            assert(true, "for relative pin please use pinSubview method")
        case .fixed(let attribute,
                    let relatedBy,
                    let constant):
            constraints.append(NSLayoutConstraint(item: self,
                                                  attribute: attribute,
                                                  relatedBy: relatedBy,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1,
                                                  constant: constant))
        case .width(let constant):
            constraints.append(contentsOf: self.pin(to: .fixed(attribute: .width, relatedBy: .equal, constant: constant)))
        case .height(let constant):
            constraints.append(contentsOf: self.pin(to: .fixed(attribute: .height, relatedBy: .equal, constant: constant)))
        }
        return activate(constraints: constraints)
    }
    
    private func activate(constraints: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        let inactiveConstraints = constraints.filter { !$0.isActive }
        NSLayoutConstraint.activate(inactiveConstraints)
        return constraints
    }
    
}
