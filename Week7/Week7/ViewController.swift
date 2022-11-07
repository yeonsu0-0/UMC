//
//  ViewController.swift
//  Week7
//
//  Created by yeonsu on 2022/11/07.
//


/* 딕셔너리 개념
// dictionary: 키를 넣으면 값이 나온다!
 
var dictionary = ["apple": "사과", "banana" : "바나나"]
print(dictionary["apple"]!)
 
dictionary["keyboard"] = "키보드"  //딕셔너리 추가
 */




import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 로그인 버튼
    @IBAction func loginButtonDidTap(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        // 데이터 읽어오기
        if UserDefaults.standard.string(forKey: name) == nil {
           print("데이터가 없습니다.")
        } else if password != UserDefaults.standard.string(forKey: name) {
           print("틀린 비밀번호입니다.")
        } else if password == UserDefaults.standard.string(forKey: name) {
            print("로그인 성공!")
        }
    }
    
    // 회원가입 버튼
    @IBAction func signUpButtonDidTap(_ sender: Any) {
        // 버튼클릭 시 회원가입 view로 이동
        guard let signUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
}




