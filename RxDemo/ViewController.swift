//
//  ViewController.swift
//  RxDemo
//
//  Created by Don on 2017/6/20.
//  Copyright © 2017年 Shenzhen Yaokan Technology Co., Ltd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var num1Field: UITextField!
    @IBOutlet weak var num2Field: UITextField!
    @IBOutlet weak var num3Field: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.combineLatest(num1Field.rx.text.orEmpty, num2Field.rx.text.orEmpty,
                                 num3Field.rx.text.orEmpty)
        { textValue1, textValue2, textValue3 -> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
            .map { $0.description }
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

