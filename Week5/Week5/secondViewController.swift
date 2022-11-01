//
//  SecondViewController.swift
//  Week4
//
//  Created by yeonsu on 2022/10/27.
//

import Foundation
import UIKit


class secondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    // 직접 프로토콜을 채택하지 않아도 사용O
    var delegate: labelChangeProtocol?  // 정의는 하지 않은 상태, 데이터값은 부모 view가 된다
    // 부모 뷰의 secondViewController.delegate = self 코드 필수!
    
//    📌 Delegate Pattern
//    객체 프로그래밍에서 하나의 객체가 모든 일을 처리하는 게 아니라 처리하는
//    부분만 따로 객체로 만들어주고 그걸 위임하는 방법
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /* A View에서 present를 호출하여 B View가 화면에 나타났을 때
     B View 에서 dismiss를 호출하면 B View 는 A View에게 해당 동작을 의뢰하고
     A View는 자신이 present 함수를 호출하여 화면에 나타났던, 자신의 presented view인 B View를 dismiss 시킨다. */
    @IBAction func backButtonDidTap(_ sender: Any) {
        
        // 텍스트를 가져옴
        guard let text = textField.text else {return}
        
        // 프로토콜에 접근해서 매개변수가 텍스트인 onChange 실행
        delegate?.onChange(text: text)
        dismiss(animated: true)
    }
}
