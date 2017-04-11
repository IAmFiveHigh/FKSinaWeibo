//
//  NavigationController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //push隐藏隐藏tabbar
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            //判断控制器类型
            if let vc = viewController as? BaseViewController {
            
                var title = "返回"
                
                // 判断控制器级数，如果只有一个子控制器 显示底控制器标题
                if childViewControllers.count == 1 {
                    
                    title = childViewControllers.first?.title ?? "返回"
                }
                
                //设置左侧返回按钮
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBackButton: true)
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc fileprivate func popToParent() {
        
        popViewController(animated: true)
    }

}
