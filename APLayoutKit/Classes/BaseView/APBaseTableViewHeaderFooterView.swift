//
//  APBaseTableViewHeaderFooterView.swift
//  APLayoutKit
//
//  Created by Vladyslav Sosiuk on 10.03.2021.
//

import UIKit

open class APBaseTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    public convenience init() {
        self.init(reuseIdentifier: String(describing: Self.self))
    }
    
    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup() {
        //abstract
    }
}
