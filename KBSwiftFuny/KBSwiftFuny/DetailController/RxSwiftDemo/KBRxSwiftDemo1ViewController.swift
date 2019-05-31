//
//  KBRxSwiftDemo1ViewController.swift
//  KBSwiftFuny
//
//  Created by 金灵波 on 2019/5/31.
//  Copyright © 2019 jinlb. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class KBRxSwiftDemo1ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var useNameTextField: UITextField!
    @IBOutlet weak var passwordTextFiedl: UITextField!
    var viewMoble : KBRxSwiftDemoModel!
    let disposeBag : DisposeBag =  DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RXSwift"
        viewMoble = KBRxSwiftDemoModel(useObservable: useNameTextField.rx.text.orEmpty.asObservable(),
                                       password: passwordTextFiedl.rx.text.orEmpty.asObservable())
        viewMoble.validate.bind(to: submitButton.rx.isEnabled).disposed(by: disposeBag)
        submitButton.rx.tap.subscribe { (event) in
            self.viewMoble.savePulish.onNext((username: self.useNameTextField.text ?? "", passwd: self.passwordTextFiedl.text ?? ""))
        }.disposed(by: disposeBag)
     }
 
    @IBAction func buttonTap(_ sender: Any) {
        
    }
    
}
