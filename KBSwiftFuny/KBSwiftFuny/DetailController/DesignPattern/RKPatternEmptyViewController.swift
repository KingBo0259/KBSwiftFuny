//
//  RKPatternEmptyViewController.swift
//  KBSwiftFuny
//
//  Created by 金灵波 on 2019/5/13.
//  Copyright © 2019 jinlb. All rights reserved.
//

import UIKit

class RKPatternEmptyViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //3.重写无参数初始化方法，自动调用xib文件
    convenience init() {
        let nibNameOrNil = NSStringFromClass((type(of: self)))
           //考虑到xib文件可能不存在或被删，故加入判断
        if Bundle.main.path(forResource: nibNameOrNil, ofType: "nib") != nil{
            self.init(nibName: nibNameOrNil, bundle: nil)
        }else{
            self.init(nibName: nil, bundle: nil)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
     }
}
