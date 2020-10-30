//
//  MasterViewController.swift
//  APLayoutKit
//
//  Created by vladislavsosiuk on 10/30/2020.
//  Copyright (c) 2020 vladislavsosiuk. All rights reserved.
//

import APLayoutKit

class MasterViewController: APBaseViewController<MasterView> {
    
    enum DetailController: CaseIterable {
        case pinToAllEdges
        case pinToVerticalEdges
        case pinToHorizontalEdges
        case top
        case bottom
        case left
        case right
        case centerVertically
        case centerHorizontally
        case center
        case widthHeight
        case safeArea
        case updatingConstraints
        
        var title: String {
            switch self {
            case .pinToAllEdges:
                return "Pin to all edges"
            case .pinToVerticalEdges:
                return "Pin to vertical edges with insets"
            case .pinToHorizontalEdges:
                return "Pin to horizontal edges with insets"
            case .top:
                return "Pin to top edge with inset"
            case .bottom:
                return "Pin to bottom edge with inset"
            case .left:
                return "Pin to left edge with inset"
            case .right:
                return "Pin to right edge with inset"
            case .centerVertically:
                return "Pin to vertical center"
            case .centerHorizontally:
                return "Pin to horizontal center"
            case .center:
                return "Pin to center of both axes"
            case .widthHeight:
                return "Pin width and height"
            case .safeArea:
                return "Pin to safe area"
            case .updatingConstraints:
                return "Updating constraints"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "APLayoutKit"
        contentView.tableView?.dataSource = self
        contentView.tableView?.delegate = self
        contentView.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailController.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MasterTableViewCell.self)) as! MasterTableViewCell
        cell.reload(text: DetailController.allCases[indexPath.row].title)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detail = DetailController.allCases[indexPath.row]
        let viewController = UIViewController()
        viewController.title = detail.title
        let containerView = viewController.view.addSubview(UIView(), pin: .pinToAllEdges) {
            $0.backgroundColor = .yellow
        }
        switch detail {
        case .pinToAllEdges:
            break
        case .pinToVerticalEdges:
            containerView.addSubview(UIView(), pin: [.pinToVerticalEdges(top: 100, bottom: 50),
                                                                           .width(constant: 50),
                                                                           .centerHorizontally]) {
                $0.backgroundColor = .red
            }
        case .pinToHorizontalEdges:
            containerView.addSubview(UIView(), pin: [.pinToHorizontalEdges(left: 30, right: 50),
                                                     .centerVertically,
                                                     .height(constant: 50)]) {
                $0.backgroundColor = .red
            }
        case .top:
            containerView.addSubview(UIView(), pin: [.top(constant: 150),
                                                     .width(constant: 50),
                                                     .height(constant: 50),
                                                     .centerHorizontally]) {
                $0.backgroundColor = .red
            }
        case .bottom:
            containerView.addSubview(UIView(), pin: [.bottom(constant: 70),
                                                     .width(constant: 50),
                                                     .height(constant: 50),
                                                     .centerHorizontally]) {
                $0.backgroundColor = .red
            }
        case .left:
            containerView.addSubview(UIView(), pin: [.left(constant: 30),
                                                     .width(constant: 50),
                                                     .height(constant: 50),
                                                     .centerVertically]) {
                $0.backgroundColor = .red
            }
        case .right:
            containerView.addSubview(UIView(), pin: [.right(constant: 60),
                                                     .width(constant: 50),
                                                     .height(constant: 50),
                                                     .centerVertically]) {
                $0.backgroundColor = .red
            }
        case .centerVertically:
            containerView.addSubview(UIView(), pin: [.centerVertically,
                                                     .pinToHorizontalEdges(left: 10, right: 10),
                                                     .height(constant: 50)]) {
                $0.backgroundColor = .red
            }
        case .centerHorizontally:
            containerView.addSubview(UIView(), pin: [.centerHorizontally,
                                                     .pinToVerticalEdges(top: 100, bottom: 50),
                                                     .width(constant: 50)]) {
                $0.backgroundColor = .red
            }
        case .center:
            containerView.addSubview(UIView(), pin: [.center,
                                                     .width(constant: 50),
                                                     .height(constant: 50)]) {
                $0.backgroundColor = .red
            }
        case .widthHeight:
            containerView.addSubview(UIView(), pin: [.width(constant: 100),
                                                     .height(constant: 200),
                                                     .center]) {
                $0.backgroundColor = .red
            }
        case .safeArea:
            containerView.addSubview(UIView(), pin: [.safeArea(.pinToAllEdges)]) {
                $0.backgroundColor = .red
            }
        case .updatingConstraints:
            containerView.addSubview(UpdateConstaintsView(), pin: .safeArea(.pinToAllEdges))
        }
        
        containerView.addSubview(UILabel(), pin: .center) {
            $0.text = detail.title
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
