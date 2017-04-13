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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func setupUI() {
        
        super.setupUI()
        
        navItem.leftBarButtonItem = UIBarButtonItem(title: "注册", fontSize: 15, target: self, action: #selector(registButtonClick))
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", fontSize: 15, target: self, action: #selector(loginButtonClick))
    }
    
    //注册
    @objc fileprivate func registButtonClick() {
        
    }
    
    //登陆
    @objc fileprivate func loginButtonClick() {
        
    }
}
