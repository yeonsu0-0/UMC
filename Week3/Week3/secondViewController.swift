//
//  secondViewController.swift
//  Week3
//
//  Created by yeonsu on 2022/10/05.
//

import UIKit

class secondViewController: UIViewController {

    var resultString = ""   // 덧셈 결과
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {   //viewWillappear도 가능
        super.viewDidLoad()
        resultLabel.text = resultString
    }
  
}
