//
//  UIView+LayoutPins.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

extension UIView {
    
    private enum LayoutGuide {
        case safeArea
    }
    
    @discardableResult
    public func pin(toView view: UIView, pin: LayoutPins) -> [NSLayoutConstraint] {
        return self.pin(toView: view, pin: pin, layoutGuide: nil)
    }
    
    @discardableResult
    private func pin(toView view: UIView, pin: LayoutPins, layoutGuide: LayoutGuide?) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        switch pin {
        case .safeArea(let pins):
            constraints.append(contentsOf: self.pin(toView: view, pin: pins, layoutGuide: .safeArea))
        case .aggregate(let pins):
            pins.forEach { constraints.append(contentsOf: self.pin(toView: view, pin: $0, layoutGuide: layoutGuide)) }
        case .relative(let attribute,
                       let relatedBy,
                       let to,
                       let multiplier,
                       let constant,
                       let priority):
            // MARK: - TODO May be wrong should think about it
            var item = self.item(forLayoutGuide: layoutGuide)
            var toItem: Any = view
            if layoutGuide != nil, attribute == .top {
                item = self
                toItem = view.item(forLayoutGuide: layoutGuide)
            }
            let constraint = NSLayoutConstraint(item: item,
                                                attribute: attribute,
                                                relatedBy: relatedBy,
                                                toItem: toItem,
                                                attribute: to ?? attribute,
                                                multiplier: multiplier,
                                                constant: constant)
            constraint.priority = priority
            constraints.append(constraint)
        case .pinToAllEdges(let insets):
            constraints.append(contentsOf: self.pin(toView: view,
                                                    pin: [
                                                        .pinToVerticalEdges(top: insets.top, bottom: insets.bottom),
                                                        .pinToHorizontalEdges(left: insets.left, right: insets.right)
                                                    ],
                                                    layoutGuide: layoutGuide))
        case .pinToVerticalEdges(let top, let bottom):
            constraints.append(contentsOf: self.pin(toView: view,
                                                    pin: [
                                                        .top(constant: top),
                                                        .bottom(constant: bottom)],
                                                    layoutGuide: layoutGuide))
        case .pinToHorizontalEdges(let left, let right):
            constraints.append(contentsOf: self.pin(toView: view,
                                                    pin: [
                                                        .left(constant: left),
                                                        .right(constant: right)],
                                                    layoutGuide: layoutGuide))
        case .top(let constant, let relation, let priority):
            constraints.append(contentsOf: view.pin(toView: self, pin: .relative(attribute: .top,
                                                                                 relatedBy: relation,
                                                                                 to: .top,
                                                                                 multiplier: 1,
                                                                                 constant: constant,
                                                                                 priority: priority),
                                                    layoutGuide: layoutGuide))
        case .bottom(let constant, let relation, let priority):
            constraints.append(contentsOf: self.pin(toView: view, pin: .relative(attribute: .bottom,
                                                                                 relatedBy: relation,
                                                                                 to: .bottom,
                                                                                 multiplier: 1,
                                                                                 constant: constant,
                                                                                 priority: priority),
                                                    layoutGuide: layoutGuide))
        case .left(let constant, let relation, let priority):
            constraints.append(contentsOf: view.pin(toView: self, pin: .relative(attribute: .leading,
                                                                                 relatedBy: relation,
                                                                                 to: .leading,
                                                                                 multiplier: 1,
                                                                                 constant: constant,
                                                                                 priority: priority),
                                                    layoutGuide: layoutGuide))
        case .right(let constant, let relation, let priority):
            constraints.append(contentsOf: self.pin(toView: view, pin: .relative(attribute: .trailing,
                                                                                 relatedBy: relation,
                                                                                 to: .trailing,
                                                                                 multiplier: 1,
                                                                                 constant: constant,
                                                                                 priority: priority),
                                                    layoutGuide: layoutGuide))
        case .fixed,
             .width,
             .height,
             .pinToSize:
            constraints = view.pin(to: pin)
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
        case .pinToAllEdges:
            assert(true, "for pinToAllEdges pin please use pinSubview method")
        case .pinToVerticalEdges:
            assert(true, "for pinToVerticalEdges pin please use pinSubview method")
        case .pinToHorizontalEdges:
            assert(true, "for pinToHorizontalEdges pin please use pinSubview method")
        case .top:
            assert(true, "for top pin please use pinSubview method")
        case .bottom:
            assert(true, "for bottom pin please use pinSubview method")
        case .left:
            assert(true, "for left pin please use pinSubview method")
        case .right:
            assert(true, "for right pin please use pinSubview method")
        case .fixed(let attribute,
                    let relatedBy,
                    let constant,
                    let priority):
            let constraint = NSLayoutConstraint(item: self,
                                                attribute: attribute,
                                                relatedBy: relatedBy,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1,
                                                constant: constant)
            constraint.priority = priority
            constraints.append(constraint)
        case .pinToSize(let size):
            constraints.append(contentsOf: self.pin(to: [
                .width(constant: size.width),
                .height(constant: size.height)
            ]))
        case .width(let constant, let relation, let priority):
            constraints.append(contentsOf: self.pin(to: .fixed(attribute: .width, relatedBy: relation, constant: constant, priority: priority)))
        case .height(let constant, let relation, let priority):
            constraints.append(contentsOf: self.pin(to: .fixed(attribute: .height, relatedBy: relation, constant: constant, priority: priority)))
        }
        return activate(constraints: constraints)
    }
    
    private func activate(constraints: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        let inactiveConstraints = constraints.filter { !$0.isActive }
        NSLayoutConstraint.activate(inactiveConstraints)
        return constraints
    }
    
    private func item(forLayoutGuide layoutGuide: LayoutGuide?) -> Any {
        switch layoutGuide {
        case .safeArea:
            return safeAreaLayoutGuide
        case .none:
            return self
        }
    }
}
