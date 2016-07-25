//
//  SingletonController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/22.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit

class SingletonController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="单例模式"
        self.view.backgroundColor=UIColor.whiteColor()
        
        
        let singleton = Singleton.sharedInstance
        singleton.firstName="king"
        singleton.lastName="bo"
        
        
        
        
    }
}
