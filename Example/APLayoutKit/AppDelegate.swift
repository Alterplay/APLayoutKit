//
//  AppDelegate.swift
//  APLayoutKit
//
//  Created by vladislavsosiuk on 10/30/2020.
//  Copyright (c) 2020 vladislavsosiuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MasterViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

