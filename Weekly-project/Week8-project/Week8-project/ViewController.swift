//
//  ViewController.swift
//  Week8
//
//  Created by yeonsu on 2022/11/19.
//

import UIKit 

class ViewController: UIViewController {

    @IBOutlet weak var newItemView: UIView!
    @IBOutlet weak var shapeView: UIView!
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    @IBAction func profileButtonDidtapped(_ sender: Any) {
        print("버튼이 클릭됐습니다!")
        newItemView.backgroundColor = UIColor.lightGray
    }
    
    
    
    @IBAction func ButtonDidTap(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.viewHeight.constant = 200
            self.view.layoutIfNeeded()  // 변경사항에 대한 업데이트 반영
            // self.view.setNeedsLayout()
        })
    }
    
}

