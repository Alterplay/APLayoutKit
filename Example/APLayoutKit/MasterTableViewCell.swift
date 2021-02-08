//
//  
//  MasterTableViewCell.swift
//  APLayoutKit_Example
//
//  Created by Vladislav Sosiuk on 30.10.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//
//

import APLayoutKit

final class MasterTableViewCell: APBaseTableViewCell {
    
    private var label: UILabel?
    
    override func setup() {
        let containerView = contentView.addSubview(UIView(), pin: .pinToAllEdges()) {
            $0.pin(to: .height(constant: 50, relation: .greaterThanOrEqual))
        }
        label = containerView.addSubview(UILabel(), pin: [.centerVertically,
                                                          .pinToHorizontalEdges(left: 15,
                                                                                right: 15)])
    }
    
    func reload(text: String) {
        label?.text = text
    }
}

#if targetEnvironment(simulator)
import SwiftUI

@available (iOS 13.0, *)
struct MasterTableViewCell_Previews: PreviewProvider {
    
    static var cell: MasterTableViewCell = {
        let cell = MasterTableViewCell()
        cell.reload(text: "Hello world")
        return cell
    }()
    
    static var previews: some View {
        Group {
            Preview {
                cell
            }
            .previewLayout(.fixed(width: 300, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        }
    }
}
#endif
