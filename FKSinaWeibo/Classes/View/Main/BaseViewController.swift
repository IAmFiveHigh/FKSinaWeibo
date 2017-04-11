//
//  BaseViewController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 64.0))
    
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1)
        
        //添加自定义bar
        view.addSubview(navigationBar)
        
        //bar添加自定义item
        navigationBar.items = [navItem]
    }
}
