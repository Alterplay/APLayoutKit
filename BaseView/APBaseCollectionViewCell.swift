//
//  APBaseCollectionViewCell.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//

import UIKit

open class APBaseCollectionViewCell: UICollectionViewCell {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    open func setup() {
        
    }
}
