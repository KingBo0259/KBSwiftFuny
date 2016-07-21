//
//  MSNSender.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/19.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation

class MSNSender:Sender {
    
    override func  sendMessage(message: String)->String {
        return "MSN Sender:\(message)"
        
    }
}