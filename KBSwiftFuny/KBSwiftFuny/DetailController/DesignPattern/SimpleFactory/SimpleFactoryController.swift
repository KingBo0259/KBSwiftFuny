//
//  SimpleFactoryController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/19.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit

class SimpleFactoryController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        let width:CGFloat=80.0,height:CGFloat=60.0;
        let mailButton = UIButton()
        mailButton.frame=CGRectMake(10, 100, width, height)
        mailButton.setTitle("Mail", forState: UIControlState.Normal)
        mailButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        mailButton.addTarget(self, action:#selector(mailClick(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(mailButton)
    }
    
    
    func mailClick(sender:UIButton)  {
        
        SimpleFactory(senderType: SenderType.Mail).senderMessage("我是谁")
        
    }

}
