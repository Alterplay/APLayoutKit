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
        .pinToVerticalEdges,
        .pinToHorizontalEdges
    ]
    
    public static let pinToVerticalEdges: LayoutPins = [
        .relative(attribute: .top,
                  relatedBy: .equal,
                  to: .top,
                  multiplier: 1,
                  constant: 0),
        .relative(attribute: .bottom,
                  relatedBy: .equal,
                  to: .bottom,
                  multiplier: 1,
                  constant: 0)
    ]
    
    public static let pinToHorizontalEdges: LayoutPins = [
        .relative(attribute: .leading,
                  relatedBy: .equal,
                  to: .leading,
                  multiplier: 1,
                  constant: 0),
        .relative(attribute: .trailing,
                  relatedBy: .equal,
                  to: .trailing,
                  multiplier: 1,
                  constant: 0)
    ]
    
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
