//
//  ViewController.swift
//  Week3-project
//
//  Created by yeonsu on 2022/10/06.
//

import UIKit

class ViewController: UIViewController {

// =============== 숫자 입력 textField ===============
    @IBOutlet weak var firstTextfield: UITextField!
    @IBOutlet weak var secondTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // =============== 나머지 연산자 버튼 ===============
    @IBAction func modButtonDidTapped(_ sender: Any) {

        guard let modViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "modViewController") as? modViewController else {return}
        
        guard let firstNum = firstTextfield.text else {return}
        
        
        guard let secondNum = secondTextfield.text else {return}
        
        // String 타입으로 값이 넘어오기 때문에 형변환 필요
        // But, Int값이 들어오지 않으면 에러 발생! (신중히 사용)
        let result = Int(firstNum)! % Int(secondNum)!
        
        modViewController.resultString = String(result)
        
        modViewController.modalPresentationStyle = .fullScreen
        
        present(modViewController, animated: true)
    
    }
    
    // =============== 나눗셈 연산자 버튼 ===============
    @IBAction func divideButtonDidTapped(_ sender: Any) {
        guard let divideViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "divideViewController") as? divideViewController else {return}
      
        guard let firstNum = firstTextfield.text else {return}
        
        
        guard let secondNum = secondTextfield.text else {return}
        
        // String 타입으로 값이 넘어오기 때문에 형변환 필요
        // But, Int값이 들어오지 않으면 에러 발생! (신중히 사용)
        let result = Int(firstNum)! / Int(secondNum)!
        
        divideViewController.resultString = String(result)
        
        divideViewController.modalPresentationStyle = .fullScreen
        
        present(divideViewController, animated: true)
        
    }
    
    
    // =============== 뺄셈 연산자 버튼 ===============
    @IBAction func minusButtonDidTapped(_ sender: Any) {
        guard let minusViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "minusViewController") as? minusViewController else {return}
        
        guard let firstNum = firstTextfield.text else {return}
        
        
        guard let secondNum = secondTextfield.text else {return}
        
        // String 타입으로 값이 넘어오기 때문에 형변환 필요
        // But, Int값이 들어오지 않으면 에러 발생! (신중히 사용)
        let result = Int(firstNum)! - Int(secondNum)!
        
        minusViewController.resultString = String(result)
        
        minusViewController.modalPresentationStyle = .fullScreen
        
        present(minusViewController, animated: true)
        
    }
    
    
    // =============== 덧셈 연산자 버튼 ===============
    @IBAction func plusButtonDidTapped(_ sender: Any) {
        
    // UIStoryboard Main에 있는 SecondViewController에 접근
        guard let plusViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "plusViewController") as? plusViewController else {return}
        

        
    // ===== 덧셈을 해서 다음 View에 넘기는 로직 =====
        guard let firstNum = firstTextfield.text else {return}
        
        
        guard let secondNum = secondTextfield.text else {return}
        
        // String 타입으로 값이 넘어오기 때문에 형변환 필요
        // But, Int값이 들어오지 않으면 에러 발생! (신중히 사용)
        let result = Int(firstNum)! + Int(secondNum)!
        
        plusViewController.resultString = String(result)
        
        plusViewController.modalPresentationStyle = .fullScreen
        
        present(plusViewController, animated: true)
    }
    
    
    
}

