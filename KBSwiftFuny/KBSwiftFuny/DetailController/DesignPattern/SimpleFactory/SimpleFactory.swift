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
    
    
    func senderMessage(messge:String)  {
        sender.sendMessage(messge)
    }
    
}