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
        
        self.view.backgroundColor=UIColor.white
        var width:CGFloat=90.0,height:CGFloat=60.0,top:CGFloat=100.0;
        
        let messageText = UITextField()
        messageText.frame = CGRect(x: 10, y: top, width: 200, height: 40)
        messageText.placeholder = "请输入消息"
    
        messageText.borderStyle = UITextField.BorderStyle.roundedRect
        self.messagetextField = messageText
    
        self.view.addSubview(messageText)
        
        top+=45
        let messageLabel = UILabel()
        self.messageLabel=messageLabel
        messageLabel.frame = CGRect(x: 10, y: top, width: 300, height: 40)
        messageLabel.textColor=UIColor.black
        messageLabel.text="我是输出结果的Label"
        self.view.addSubview(messageLabel)
        
        top+=45

        
        let mailButton = UIButton()
        mailButton.frame =  CGRect(x: 10, y: top, width: width, height: height)
        mailButton.setTitle("Mail",for: .normal)
        mailButton.setTitleColor(UIColor.blue, for:.normal)
        
        mailButton.addTarget(self, action:#selector(mailClick(_:)) , for: UIControl.Event.touchUpInside)
        self.view.addSubview(mailButton)
        
        
        let qqButton = UIButton()
        qqButton.frame = CGRect(x: mailButton.frame.maxX, y: top, width: width, height: height)
        qqButton.setTitle("QQ", for:  .normal)
        qqButton.setTitleColor(UIColor.blue, for:.normal)
        
        qqButton.addTarget(self, action:#selector(qqClick(qq:)) , for: .touchUpInside)
        self.view.addSubview(qqButton)
        
        let msnButton = UIButton()
        msnButton.frame =   CGRect(x: qqButton.frame.maxX, y: top, width: width, height: height)
        msnButton.setTitle("MSN", for:  .normal)
        msnButton.setTitleColor(UIColor.blue, for: .normal)
        
        msnButton.addTarget(self, action:#selector(msnClick(msn:)) , for: .touchUpInside)
        self.view.addSubview(msnButton)
        top+=45
        let switchButton=UIButton()
        switchButton.frame = CGRect(x: 10, y: top, width: 200, height: height)
        switchButton.setTitle("切换成工厂方法", for: .normal)
        switchButton.setTitleColor(UIColor.blue, for: .normal)
        switchButton.addTarget(self, action:#selector(switchClick(_:)) , for: .touchUpInside)
        self.view.addSubview(switchButton)

        
    }
    
    @objc func switchClick(_ sender:UIButton) {
        simpleFlag = !simpleFlag
        sender.setTitle(simpleFlag ? "切换成工厂方法":"切换成简单工厂", for:.normal)
    }
    
    @objc func mailClick(_ sender:UIButton)  {
        
        self.messagetextField?.resignFirstResponder()
        var message:String?
        if simpleFlag {
            message = (SimpleFactory(senderType: SenderType.Mail)).senderMessage(messge: messagetextField!.text!)
        }else{
            let mySender=MailFactory().product()
            message = mySender?.sendMessage(message: messagetextField!.text!)
        }
       self.messageLabel?.text=message
    }
    
    @objc func qqClick(qq sender:UIButton)  {
        self.messagetextField?.resignFirstResponder()
        var  message:String?
        if simpleFlag {
            message = SimpleFactory(senderType: SenderType.QQ).senderMessage(messge: messagetextField!.text!)
        }else{
            let mySender=QQFactory().product()
            message = mySender?.sendMessage(message: messagetextField!.text!)
        }
        self.messageLabel?.text=message
    }
    
   @objc func msnClick(msn sender:UIButton)  {
        self.messagetextField?.resignFirstResponder()
        var  message:String?
        if simpleFlag {
            message = SimpleFactory(senderType: SenderType.MSN).senderMessage(messge: messagetextField!.text!)
        }else{
            let mySender=MSNFactory().product()
            message = mySender?.sendMessage(message: messagetextField!.text!)
        }
        self.messageLabel?.text=message
    }

}
