//
//  MSNFacotry.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/21.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation

class MSNFactory: Provider {
    override func product() -> Sender? {
        return MSNSender()
    }
}