//
//  AppDelegate.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        sleep(2)
        
        window = UIWindow()
        window?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

