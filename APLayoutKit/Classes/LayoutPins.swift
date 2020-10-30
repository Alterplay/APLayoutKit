//
//  LayoutPins.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

public enum LayoutPins: ExpressibleByArrayLiteral {
    
    // MARK: - Convenience values
    
    public static let pinToAllEdges: LayoutPins = [
        .pinToVerticalEdges(),
        .pinToHorizontalEdges()
    ]
    
    case pinToVerticalEdges(top: CGFloat = .zero, bottom: CGFloat = .zero)
    case pinToHorizontalEdges(left: CGFloat = .zero, right: CGFloat = .zero)
    
    case top(constant: CGFloat = .zero)
    case left(constant: CGFloat = .zero)
    case right(constant: CGFloat = .zero)
    case bottom(constant: CGFloat = .zero)
    
    public static let centerVertically: LayoutPins = .relative(attribute: .centerY,
                                                        relatedBy: .equal,
                                                        to: .centerY,
                                                        multiplier: 1,
                                                        constant: 0)
    public static let centerHorizontally: LayoutPins = .relative(attribute: .centerX,
                                                          relatedBy: .equal,
                                                          to: .centerX,
                                                          multiplier: 1,
                                                          constant: 0)
    public static let center: LayoutPins = [
        .centerVertically,
        .centerHorizontally
    ]
    case width(constant: CGFloat)
    case height(constant: CGFloat)
    
    // MARK: - Regular Values
    
    case relative(
            attribute: NSLayoutConstraint.Attribute,
            relatedBy: NSLayoutConstraint.Relation,
            to: NSLayoutConstraint.Attribute,
            multiplier: CGFloat,
            constant: CGFloat)
    
    case fixed(
            attribute: NSLayoutConstraint.Attribute,
            relatedBy: NSLayoutConstraint.Relation,
            constant: CGFloat)
    
    indirect case safeArea(LayoutPins)
    
    indirect case aggregate([LayoutPins])
    
    // MARK: - Init
    
    public init(arrayLiteral: LayoutPins...) {
        self = .aggregate(arrayLiteral)
    }
}
