//
//  Singleton.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/22.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation


class Singleton {

    var firstName:NSString?
    var lastName:NSString?

    //设置为私有，以确保外部无法初始化
    private init(){}
    
    class var sharedInstance: Singleton {
        
        struct Static {
            static var onceToken:dispatch_once_t=0
            static var  instance:Singleton?=nil
        }
        
        dispatch_once(&Static.onceToken){
        
            Static.instance=Singleton()
        }
        
        
        return Static.instance!
    }
    
}