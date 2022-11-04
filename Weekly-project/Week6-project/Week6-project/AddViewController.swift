//
//  AddViewController.swift
//  Week6-project
//
//  Created by yeonsu on 2022/11/05.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var titleField: UITextField!      // 제목
    @IBOutlet var subTitleField: UITextField!   // 내용
    @IBOutlet var datePicker: UIDatePicker!     // 날짜 선택
    
    public var completion: ((String, Date) -> Void)?    // 입력 결과 반환
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self
                                                            , action: #selector(didTapSaveButton))
    }
    
    @objc func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty{
            
            let targetDate = datePicker.date
            
            completion?(titleText, targetDate)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
