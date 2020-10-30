//
//  MainView.swift
//  APLayoutKit_Example
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import APLayoutKit

class MainView: APBaseView {
    
    override func setup() {
        backgroundColor = .white
        addSubview(UILabel(), pin: .center) {
            $0.text = "Hello world"
        }
    }
}

#if targetEnvironment(simulator)
import SwiftUI

@available (iOS 13.0, *)
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Preview {
                MainView()
            }
            .previewLayout(.device)
        }
    }
}
#endif
