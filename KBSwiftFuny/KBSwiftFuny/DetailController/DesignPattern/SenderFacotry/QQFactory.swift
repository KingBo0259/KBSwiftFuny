//
//  QQFactory.swift
//  KBSwiftFuny
//
//  Created by jinlb on 16/7/21.
//  Copyright © 2016年 jinlb. All rights reserved.
//

import Foundation

class QQFactory: Provider {
    override func product() -> Sender? {
        return QQSender()
    }
}