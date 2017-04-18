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

    /// 用户登录标记
    var userLogon: Bool = false
    
    /// 表格视图
    var tableView: UITableView?
    
    /// 刷新控件
    var refreshControl: UIRefreshControl?
    
    /// 自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 64.0))
    
    /// 自定义导航条目
    lazy var navItem: UINavigationItem = UINavigationItem()
    
    /// 是否上拉
    var isPullup: Bool = false
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        automaticallyAdjustsScrollViewInsets = false
        
        setupUI()
        
    }
    
    
    func setupUI() {
        
        setupnavigationBar()
        
        // 用户登录加载tableView，否则visitorView
        userLogon ? setupTableView() : setupVisitorView()
        
    }
    
    //MARK: 设置tableView
    public func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        //设置tableView缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.height(),
                                               left: 0,
                                               bottom: tabBarController?.tabBar.height() ?? 0,
                                               right: 0)
        //设置刷新控件
        refreshControl = UIRefreshControl()
        
        tableView?.addSubview(refreshControl!)
        
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
        refreshControl?.tintColor = UIColor.orange
    }
    
    //MARK: 设置visitorView
    public func setupVisitorView() {
        
        let visitorView = UIView(frame: view.bounds)
        
        visitorView.backgroundColor = UIColor.white
        
        view.insertSubview(visitorView, belowSubview: navigationBar)
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
    
    func loadData() {
        
        //结束刷新
        refreshControl?.endRefreshing()
    }
}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        return UITableViewCell()
    }
    
    /// 先是最后一行的时候 做上拉加载
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //判断indexpath是否最后一行
        let row = indexPath.row
        
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPullup{
            
            print("上拉了")
            isPullup = true
            
            //开始
            loadData()
        }
    }
}
