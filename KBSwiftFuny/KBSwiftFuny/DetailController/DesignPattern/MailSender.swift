//
//  MailSender.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/19.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation


class MailSender:Sender {
    
    //final  表示子类不可以进重写
   override final func  sendMessage(message: String)->String {
    
        return "mail Sender:\(message)"
    }
}