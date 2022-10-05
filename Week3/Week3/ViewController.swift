//
//  ViewController.swift
//  Week3
//  View Life Cycle
//
//  Created by yeonsu on 2022/10/05.
//


import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    
    // 📌 viewDidLoad()
    // View가 메모리에 호출될 때 실행되는 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    // 📌viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillApear")
    }

    // 📌viewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    // 📌viewWillDisappear()
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    // 📌viewDidDisappear()
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
        
        // UIStoryboard Main에 있는 SecondViewController에 접근
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        
        
        
        // ===== 덧셈을 해서 다음 View에 넘기는 로직 =====
        guard let firstNum = firstTextField.text else {return}
        
        
        guard let secondNum = secondTextField.text else {return}
        
        // String 타입으로 값이 넘어오기 때문에 형변환 필요
        // But, Int값이 들어오지 않으면 에러 발생! (신중히 사용)
        let result = Int(firstNum)! + Int(secondNum)!
        
        nextViewController.resultString = String(result)
        // =======================================
        
        
        nextViewController.modalPresentationStyle = .fullScreen
        
        present(nextViewController, animated: true)
    }
    
}

