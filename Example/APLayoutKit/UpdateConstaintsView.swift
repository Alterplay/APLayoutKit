//
//  
//  UpdateConstaintsView.swift
//  APLayoutKit_Example
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
//

import APLayoutKit

final class UpdateConstaintsView: APBaseView {
    
    private var buttonWidthConstraint: NSLayoutConstraint?
    
    override func setup() {
        addSubview(UIButton(), pin: [.center, .height(constant: 40)]) {
            $0.backgroundColor = .red
            $0.setTitle("Tap ME", for: .normal)
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
            self.buttonWidthConstraint = $0.pin(to: .width(constant: 170)).first
        }
    }
    
    @objc private func buttonTapped() {
        buttonWidthConstraint?.constant = CGFloat.random(in: 170...300)
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

#if targetEnvironment(simulator)
import SwiftUI

@available (iOS 13.0, *)
struct UpdateConstaintsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Preview {
                UpdateConstaintsView()
            }
        }
    }
}
#endif
