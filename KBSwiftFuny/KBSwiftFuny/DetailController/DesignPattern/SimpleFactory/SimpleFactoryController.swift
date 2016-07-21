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
    
    
    var simpleFlag:Bool=true

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="工厂方法"
        
        self.view.backgroundColor=UIColor.whiteColor()
        var width:CGFloat=90.0,height:CGFloat=60.0,top:CGFloat=100.0;
        
        let messageText = UITextField()
        messageText.frame=CGRectMake(10, top, 200, 40)
        messageText.placeholder="请输入消息"
    
        messageText.borderStyle=UITextBorderStyle.RoundedRect
        self.messagetextField=messageText
    
        self.view.addSubview(messageText)
        
        top+=45
        let messageLabel = UILabel()
        self.messageLabel=messageLabel
        messageLabel.frame=CGRectMake(10, top, 300, 40)
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
        
        

        top+=45
        
        let switchButton=UIButton()
        switchButton.frame=CGRectMake(10,top, 200, height)
        switchButton.setTitle("切换成工厂方法", forState: UIControlState.Normal)
        switchButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        switchButton.addTarget(self, action:#selector(switchClick(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(switchButton)

        
    }
    
    func switchClick(sender:UIButton) {
        simpleFlag = !simpleFlag
        
        sender.setTitle(simpleFlag ? "切换成工厂方法":"切换成简单工厂", forState: UIControlState.Normal)
    }
    
    func mailClick(sender:UIButton)  {
        
        self.messagetextField?.resignFirstResponder()
        var message:String?
        if simpleFlag {
            message = (SimpleFactory(senderType: SenderType.Mail)).senderMessage(messagetextField!.text!)
        }else{
            let mySender=MailFactory().product()
            message = mySender?.sendMessage(messagetextField!.text!)
        }
       self.messageLabel?.text=message
    }
    
    func qqClick(qq sender:UIButton)  {
        self.messagetextField?.resignFirstResponder()
        var  message:String?
        if simpleFlag {
            message = SimpleFactory(senderType: SenderType.QQ).senderMessage(messagetextField!.text!)
        }else{
        
            let mySender=QQFactory().product()
            message = mySender?.sendMessage(messagetextField!.text!)
        }
        self.messageLabel?.text=message

    }
    
    func msnClick(msn sender:UIButton)  {
        self.messagetextField?.resignFirstResponder()
        var  message:String?

        if simpleFlag {
             message = SimpleFactory(senderType: SenderType.MSN).senderMessage(messagetextField!.text!)

        }else{
            
            let mySender=MSNFactory().product()
            message = mySender?.sendMessage(messagetextField!.text!)
        }

        self.messageLabel?.text=message
    }

}
