//
//  HomeViewController.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit


private let cellID = "homeCellID"

class HomeViewController: BaseViewController {

    fileprivate var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setupUI() {
        
        super.setupUI()
        
        //tableView注册cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellID)

        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", fontSize: 15, target: self, action: #selector(registButtonClick))
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", fontSize: 15, target: self, action: #selector(loginButtonClick))
    }
    
    //注册
    @objc fileprivate func registButtonClick() {
        
    }
    
    //登陆
    @objc fileprivate func loginButtonClick() {
        
    }
    
    override func loadData() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            for index in 0..<15 {
                
                self.dataArray.insert(index.description, at: 0)
            }
            
            //结束刷新
            self.refreshControl?.endRefreshing()
            
            //上拉结束
            self.isPullup = false
            
            //tableView刷新UI
            self.tableView?.reloadData()
        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
}


