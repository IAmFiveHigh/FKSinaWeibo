//
//  MainViewController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        
    }

    //MARK: 设置所有子控制器
    fileprivate func setupChildControllers() {
        
        let array = [["clsName": "HomeViewController", "title": "首页", "imageName": ""],
                     ["clsName": "MessageViewController", "title": "消息", "imageName": ""],
                     ["clsName": "DiscoverViewController", "title": "发现", "imageName": ""],
                     ["clsName": "ProfileViewController", "title": "我", "imageName": ""]
                     ]
        
        var ViewControllerArray = [UIViewController]()
        
        //遍历数组创建控制器并保存到新数组
        for dict in array {
            
            ViewControllerArray.append(controller(dict: dict))
        }
        
        //设置tabbarViewController的viewControllers
        viewControllers = ViewControllerArray
    }
    
    //MARK: 使用字典创建子控制器
    fileprivate func controller(dict: [String: String]) -> UIViewController {
        
        //1 取得字典内容
        guard let clsName = dict["clsName"] else {
            return UIViewController()
        }
        
        guard let title = dict["title"] else {
            return UIViewController()
        }
        
        guard let imageName = dict["imageName"] else {
            return UIViewController()
        }
        
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
        
        let vc = cls?.init()
        
        vc?.title = title
        
        let nav = NavigationController(rootViewController: vc!)
        
        return nav
    }

}

extension Bundle {
    
    var nameSpace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
