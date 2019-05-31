//
//  KBFavitorViewController.swift
//  KBSwiftFuny
//
//  Created by 金灵波 on 2019/5/31.
//  Copyright © 2019 jinlb. All rights reserved.
//

import UIKit

class KBFavitorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBAction func voiceTap(_ sender: Any) {
        let vc = KBSpeechRecognizerViewController()
        vc.hidesBottomBarWhenPushed =  true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func rxSwiftTap(_ sender: Any) {
        let vc = KBRxSwiftDemo1ViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
