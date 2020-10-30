//
//  APBaseTableViewCell.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//

import UIKit

open class APBaseTableViewCell: UITableViewCell {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    open func setup() {
        
    }
}
