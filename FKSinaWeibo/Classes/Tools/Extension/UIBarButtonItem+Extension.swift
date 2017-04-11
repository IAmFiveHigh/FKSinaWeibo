//
//  UIBarButtonItem+Extension.swift
//  FKSinaWeibo
//
//  Created by 我是五高你敢信 on 2017/4/11.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 创建 UIBarbuttonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: 字号大小
    ///   - target: target
    ///   - action: 方法
    convenience init(title: String, fontSize: CGFloat = 16, target: Any?, action: Selector) {
        
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        
        self.init(customView: btn)
    }
}
