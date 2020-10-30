//
//  APBaseView.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

open class APBaseView: UIView {
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    open func setup() {
        //abstract
    }
}
