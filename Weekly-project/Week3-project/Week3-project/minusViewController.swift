//
//  minusViewController.swift
//  Week3-project
//
//  Created by yeonsu on 2022/10/07.
//

import UIKit

class minusViewController: UIViewController {

    var resultString = ""   // 덧셈 결과

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func replayButton(_ sender: Any) {
        self.dismiss(animated: true)    // 뒤로가기
    }
    
    
    override func viewDidLoad() {   //viewWillappear도 가능
        super.viewDidLoad()
        resultLabel.text = resultString
    }
  
}
