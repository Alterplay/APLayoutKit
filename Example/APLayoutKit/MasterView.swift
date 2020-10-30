//
//  MainView.swift
//  APLayoutKit_Example
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import APLayoutKit

class MasterView: APBaseView {
    
    var tableView: UITableView?
    
    override func setup() {
        backgroundColor = .systemBackground
        tableView = addSubview(UITableView(), pin: [.pinToHorizontalEdges(),
                                                    .safeArea(.top()),
                                                    .bottom()]) {
            $0.register(MasterTableViewCell.self, forCellReuseIdentifier: String(describing: MasterTableViewCell.self))
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
                MasterView()
            }
            .previewLayout(.device)
        }
    }
}
#endif
