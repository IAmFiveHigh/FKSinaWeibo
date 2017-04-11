//
//  BaseViewController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let KBarTintColor: (CGFloat,CGFloat,CGFloat) = (245, 245 ,245)

class BaseViewController: UIViewController {

    /// 表格视图
    var tableView: UITableView?
    
    /// 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 64.0))
    
    /// 自定义导航条目
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: CGFloat(arc4random() % 255) / 255.0, green: CGFloat(arc4random() % 255) / 255.0, blue: CGFloat(arc4random() % 255) / 255.0, alpha: 1)
        
        setupnavigationBar()
        
        setupTableView()

    }
    
    //MARK: 设置tableView
    public func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    
    //MARK: 设置导航条
    public func setupnavigationBar() {
        
        //添加自定义bar
        view.addSubview(navigationBar)
        
        //bar添加自定义item
        navigationBar.items = [navItem]
        
        //bar渲染颜色
        navigationBar.barTintColor = UIColor(red: KBarTintColor.0 / 255.0, green: KBarTintColor.1 / 255.0, blue: KBarTintColor.2 / 255.0, alpha: 1)
        
        //bar字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}
