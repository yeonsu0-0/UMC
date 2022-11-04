//
//  AddViewController.swift
//  Week6-project
//
//  Created by yeonsu on 2022/11/05.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleField: UITextField!      // 제목
    @IBOutlet var subTitleField: UITextField!   // 내용
    @IBOutlet var datePicker: UIDatePicker!     // 날짜 선택
    
    public var completion: ((String, String, Date) -> Void)?    // 입력 결과 반환
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
           let subTitleText = subTitleField.text, !subTitleText.isEmpty {
            
            let targetDate = datePicker.date
        }
    }

}
