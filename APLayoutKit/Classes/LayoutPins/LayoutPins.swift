//
//  LayoutPins.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

public enum LayoutPins: ExpressibleByArrayLiteral {
    
    // MARK: - Convenience values
    
    case pinToAllEdges(insets: UIEdgeInsets = .zero)
    case pinToVerticalEdges(top: CGFloat = .zero, bottom: CGFloat = .zero)
    case pinToHorizontalEdges(left: CGFloat = .zero, right: CGFloat = .zero)
    
    case top(constant: CGFloat = .zero, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    case left(constant: CGFloat = .zero, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    case right(constant: CGFloat = .zero, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    case bottom(constant: CGFloat = .zero, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    
    public static let centerVertically: LayoutPins = .relative(attribute: .centerY,
                                                               relatedBy: .equal,
                                                               to: .centerY,
                                                               multiplier: 1,
                                                               constant: 0,
                                                               priority: .required)
    public static let centerHorizontally: LayoutPins = .relative(attribute: .centerX,
                                                                 relatedBy: .equal,
                                                                 to: .centerX,
                                                                 multiplier: 1,
                                                                 constant: 0,
                                                                 priority: .required)
    public static let center: LayoutPins = [
        .centerVertically,
        .centerHorizontally
    ]
    case pinToSize(size: CGSize)
    case width(constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    case height(constant: CGFloat, relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required)
    
    // MARK: - Regular Values
    
    case relative(
            attribute: NSLayoutConstraint.Attribute,
            relatedBy: NSLayoutConstraint.Relation = .equal,
            to: NSLayoutConstraint.Attribute? = nil,
            multiplier: CGFloat = 1,
            constant: CGFloat,
            priority: UILayoutPriority = .required)
    
    case fixed(
            attribute: NSLayoutConstraint.Attribute,
            relatedBy: NSLayoutConstraint.Relation,
            constant: CGFloat,
            priority: UILayoutPriority)
    
    indirect case safeArea(LayoutPins)
    
    indirect case aggregate([LayoutPins])
    
    // MARK: - Init
    
    public init(arrayLiteral: LayoutPins...) {
        self = .aggregate(arrayLiteral)
    }
}
