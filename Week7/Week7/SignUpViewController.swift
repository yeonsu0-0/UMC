//
//  SignUpViewController.swift
//  Week7
//
//  Created by yeonsu on 2022/11/07.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 회원가입 버튼
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        // 데이터 저장
        UserDefaults.standard.set(password, forKey: name)
        // 데이터 임시 확인
        print("이름: \(name), 비밀번호: \(password)")
        
        navigationController?.popViewController(animated: true)
    }
    
    // 취소 버튼
    @IBAction func cancelButtonDidTap(_ sender: Any) {
    }
    
}
