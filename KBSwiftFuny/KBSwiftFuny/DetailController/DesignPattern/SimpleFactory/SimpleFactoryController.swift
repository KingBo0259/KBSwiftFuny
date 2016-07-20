//
//  SimpleFactoryController.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/19.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import UIKit




class SimpleFactoryController: UIViewController {
    
    
    
    var messagetextField:UITextField?
    var messageLabel:UILabel?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor=UIColor.whiteColor()
        var width:CGFloat=120.0,height:CGFloat=60.0,top:CGFloat=100.0;
        
        let messageText = UITextField()
        messageText.frame=CGRectMake(100, top, 200, 40)
        messageText.placeholder="请输入消息"
    
        messageText.borderStyle=UITextBorderStyle.RoundedRect
        self.messagetextField=messageText
    
        self.view.addSubview(messageText)
        
        top+=45
        let messageLabel = UILabel()
        self.messageLabel=messageLabel
        messageLabel.frame=CGRectMake(100, top, 200, 40)
        messageLabel.textColor=UIColor.blackColor()
        messageLabel.text="我是输出结果的Label"
        self.view.addSubview(messageLabel)
        
        top+=45

        
        let mailButton = UIButton()
        mailButton.frame=CGRectMake(10, top, width, height)
        mailButton.setTitle("Mail", forState: UIControlState.Normal)
        mailButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        mailButton.addTarget(self, action:#selector(mailClick(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(mailButton)
        
        
        let qqButton = UIButton()
        qqButton.frame=CGRectMake(CGRectGetMaxX(mailButton.frame),top, width, height)
        qqButton.setTitle("QQ", forState: UIControlState.Normal)
        qqButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        qqButton.addTarget(self, action:#selector(qqClick(qq:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(qqButton)
        
        
        
        let msnButton = UIButton()
        msnButton.frame=CGRectMake(CGRectGetMaxX(qqButton.frame),top, width, height)
        msnButton.setTitle("MSN", forState: UIControlState.Normal)
        msnButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        msnButton.addTarget(self, action:#selector(msnClick(msn:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(msnButton)
        
        
    }
    
    
    func mailClick(sender:UIButton)  {
       let message:String?=(SimpleFactory(senderType: SenderType.Mail)).senderMessage(messagetextField!.text!)
       self.messageLabel?.text=message
    }
    
    func qqClick(qq sender:UIButton)  {
       let message = SimpleFactory(senderType: SenderType.QQ).senderMessage(messagetextField!.text!)
        self.messageLabel?.text=message

    }
    
    func msnClick(msn sender:UIButton)  {
       let message = SimpleFactory(senderType: SenderType.MSN).senderMessage(messagetextField!.text!)
        self.messageLabel?.text=message
    }

}
