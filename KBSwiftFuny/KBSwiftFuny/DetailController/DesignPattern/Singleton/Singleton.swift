//
//  Singleton.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/22.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation


class Singleton {

    var firstName:String = "kingbo"
    var lastName:String = "bo"

    //设置为私有，以确保外部无法初始化
    private init(){}
    
    static let  sharedInstance = Singleton()
   
    
}
