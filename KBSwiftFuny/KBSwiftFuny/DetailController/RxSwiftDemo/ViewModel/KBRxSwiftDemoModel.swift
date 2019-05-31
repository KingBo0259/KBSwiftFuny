//
//  KBRxSwiftDemoModel.swift
//  KBSwiftFuny
//
//  Created by 金灵波 on 2019/5/31.
//  Copyright © 2019 jinlb. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class KBRxSwiftDemoModel {
    let userNameObservable :Observable<Bool>
    let passwordObservable :Observable<Bool>
    let validate : Observable<Bool>
    let savePulish: PublishSubject<(username:String,passwd:String)> = PublishSubject<(username:String,passwd:String)>()

    init(useObservable:Observable<String> ,password:Observable<String>) {
        self.userNameObservable  = useObservable.map({$0.count > 0 }).share(replay: 1)
        self.passwordObservable = password.map({$0.count > 0}).share(replay:1)
        self.validate = Observable.combineLatest(self.userNameObservable,self.passwordObservable){$0 && $1}
        _ = savePulish.subscribe { (event) in
          print(event.element?.username)  
        }
        
    }
}
