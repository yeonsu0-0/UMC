//
//  ViewController.swift
//  Week2
//
//  Created by yeonsu on 2022/09/26.
//

import UIKit 

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var newItemView: UIView!
    
    @IBAction func profileButtonDidtapped(_ sender: Any) {
        print("버튼이 클릭됐습니다!")
        newItemView.backgroundColor = UIColor.lightGray
    }
    
       }

