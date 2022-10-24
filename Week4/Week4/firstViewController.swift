//
//  ViewController.swift
//  Week4
//
//  Created by yeonsu on 2022/10/15.
//

import UIKit

// 프로토콜에서 구현부는 작성하지 않는다!

protocol labelChangeProtocol {
    func onChange(text: String)
}

// labelChangeProtocol 프로토콜 채택
class firstViewController: UIViewController, labelChangeProtocol {
    
    // 프로토콜 최소 요구사항 구현
    // 프로토콜 채택은 부모 view가, 함수 사용은 자식뷰인 secondViewController에서!
    func onChange(text: String) {
        label.text = text   // 구현부 작성
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // 📌 화면전환 시 필요한 instantiateViewController
    /*
    storyboard ID(identifier)와 storyboard name을 가지고 storyboard 객체를 통해서 instantiateViewController를 사용하여 UI 요소까지 호출한다.
     */

    @IBAction func buttonDidTap(_ sender: Any) {
        guard let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        
        
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.delegate = self    // 화면이 전환되기 전에 미리 변수에 접근해서 초기화시킴
        
        
        present(secondViewController, animated: true)
    }
}

