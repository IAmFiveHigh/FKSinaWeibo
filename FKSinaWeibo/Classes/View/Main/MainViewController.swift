//
//  MainViewController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let KDarkOrigin: (CGFloat,CGFloat,CGFloat) = (255.0, 140.0, 0)

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class MainViewController: UITabBarController {

    
    fileprivate lazy var composeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "composeButton"), for: .normal)
        button.addTarget(self, action: #selector(composeButtonClick), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        
        setupComposeButton()
        
        tabBar.barTintColor = UIColor(red: KBarTintColor.0 / 255.0, green: KBarTintColor.1 / 255.0, blue: KBarTintColor.2 / 255.0, alpha: 1)

    }
    
    //MARK: 设置设备方向 竖屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        return .portrait
    }

    //MARK: 设置所有子控制器
    fileprivate func setupChildControllers() {
        
        let array = [["clsName": "HomeViewController", "title": "首页", "imageName": "首页"],
                     ["clsName": "MessageViewController", "title": "消息", "imageName": "信息"],
                     ["clsName": "UIViewController"],
                     ["clsName": "DiscoverViewController", "title": "发现", "imageName": "发现"],
                     ["clsName": "ProfileViewController", "title": "我", "imageName": "我的"]
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
        
        let vc = cls!.init()
        
        //设置title
        vc.title = title
        
        //设置icon
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "-black")?.withRenderingMode(.alwaysOriginal)
        
        //设置标题字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .highlighted)
        
        //系统默认12
//        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 14)], for: .normal)
        
        let nav = NavigationController(rootViewController: vc)
        
        return nav
    }
    
    //MARK: - 设置中间button
    fileprivate func setupComposeButton() {
        
        //1 添加到tabbar
        tabBar.addSubview(composeButton)
        
        //2 计算按钮位置
        let count: CGFloat = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
    }
    
    @objc fileprivate func composeButtonClick() {
        
    }

}


