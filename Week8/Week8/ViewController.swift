//
//  ViewController.swift
//  Week8
//
//  Created by yeonsu on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var orangeViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var purpleViewTapGestureRecognizer: UITapGestureRecognizer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // #selector: object-c의 함수 사용
        purpleViewTapGestureRecognizer.addTarget(self, action: #selector(purpleViewDidTap))
    }
    
    @objc func purpleViewDidTap() {
        // TODO: - 애니메이션 추가
        UIView.animate(withDuration: 3, animations: {
            self.orangeViewTopConstraint.constant = 200
            self.orangeViewHeightConstraint.constant = 100
            self.view.layoutIfNeeded()
        }
        )
    }

    // 📌 UIView.animate: 애니메이션 적용하기
    @IBAction func buttonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 3, animations: {
            self.orangeViewTopConstraint.constant = 200
            self.orangeViewHeightConstraint.constant = 300
            self.view.layoutIfNeeded()  // 변경사항에 대한 업데이트 반영
            // self.view.setNeedsLayout()
        })
    }
}

