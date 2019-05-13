//
//  SingletonController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/22.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit

class SingletonController: UIViewController {
    
    lazy var  userNameTextFiled : UITextField = {
        let userName = UITextField()
        userName.text = Singleton.sharedInstance.firstName as String
        userName.translatesAutoresizingMaskIntoConstraints  = false
        userName.borderStyle = .roundedRect
        return userName
    }()
    
    lazy var saveButton  :UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints  = false //布局时候设置非常z
        button.showsTouchWhenHighlighted = true
        button.setTitle("保存", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(save(_:)), for: .touchUpInside)
        if #available(iOS 11.0, *) {
            button.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        }
        button.layer.masksToBounds = true
        return button
    }()

    @objc func save(_ sender:Any) {
        view.endEditing(true)
        Singleton.sharedInstance.firstName = userNameTextFiled.text ?? ""
        
        let alertVC = UIAlertController(title: "保存成功", message: "请退出再次进来查看结果", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "确定", style: .default, handler: { [unowned self] (action) in
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alertVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="单例模式"
        self.view.backgroundColor=UIColor.white
        view.addSubview(userNameTextFiled)
        view.addSubview(saveButton)
        
        let dicViews = ["input":userNameTextFiled,"button":saveButton]
     
        NSLayoutConstraint.activate( NSLayoutConstraint.constraints(withVisualFormat: "H:|-[input]-|", options: [], metrics:nil, views: dicViews))
        NSLayoutConstraint.activate( NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button]-|", options: [], metrics:nil, views: dicViews))
        NSLayoutConstraint.activate( NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[input(60)]-[button(40)]",options: [], metrics: nil, views: dicViews))
    
    }
}
