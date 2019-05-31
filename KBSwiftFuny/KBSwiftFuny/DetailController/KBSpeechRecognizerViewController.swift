//
//  KBSpeechRecognizerViewController.swift
//  KBSwiftFuny
//
//  Created by 金灵波 on 2019/5/20.
//  Copyright © 2019 jinlb. All rights reserved.
//

import UIKit
import Speech

class KBSpeechRecognizerViewController: UIViewController {

    lazy var beginButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start recognize", for: .normal)
        button.addTarget(self, action: #selector(startRecognizeClick(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(beginButton)
        view.backgroundColor = .white
        
        view.addConstraint(NSLayoutConstraint.init(item: beginButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0))
         view.addConstraint(NSLayoutConstraint.init(item: beginButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0))
    
     }
    
    @objc func startRecognizeClick(_ sender :Any) {
        if #available(iOS 10.0, *) {
            SFSpeechRecognizer.requestAuthorization { [unowned  self] (authStatus) in
                DispatchQueue.main.async {
                    if authStatus == .authorized {
                        print("Good to go!")
                    } else {
                        print("Transcription permission was declined.")
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    @IBAction func rxswiftClick(_ sender: Any) {
        
    }
    
    
}
