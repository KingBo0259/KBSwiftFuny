//
//  SimpleFactory.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/19.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation


enum SenderType {
    case Mail,MSN,QQ
}

class SimpleFactory {

    var sender:SenderProtocol
    //简单工程其实这里存在着扩展问题，若添加一个类 则需要更改 改类的方法，则违背了 开闭原则－－>工厂方法来进行更改
    init(senderType:SenderType){
        
        switch senderType {
        case SenderType.Mail:
            sender=MailSender()
        case SenderType.MSN:
            sender=MSNSender()
        case SenderType.QQ:
            sender=QQSender()
        }
    }
    
    
    func senderMessage(messge:String) ->String? {
        return "简单工厂" + sender.sendMessage(message: messge)
    }
    
}
