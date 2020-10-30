//
//  APBaseViewController.swift
//  APLayoutKit
//
//  Created by Vladislav Sosiuk on 29.10.2020.
//

import UIKit

open class APBaseViewController<ContentView: UIView>: UIViewController {

    final lazy var contentView = makeContentView()
    
    final public override func loadView() {
        view = contentView
    }
    
    final func makeContentView() -> ContentView {
        ContentView()
    }
}
