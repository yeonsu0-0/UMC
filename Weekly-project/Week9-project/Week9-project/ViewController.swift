//
//  ViewController.swift
//  Week9-project
//
//  Created by yeonsu on 2022/11/24.
//

import UIKit


// 테이블 뷰를 사용하기 위한 프로토콜 채택
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 프로토콜 사용 시 필수 작성 */
        table.dataSource = self
        table.delegate = self
    }

    
    /* 프로토콜 채택 시 필수적인 메소드: numberOfRowsInSection, cellForRowAt */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // numberOfSections: 섹션의 갯수(따로 지정하지 않으면 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return UITableViewCell()
        
        /*
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "myCell")    // 셀 스타일의 종류: default, value1(설정), value2(전화번호부), subTitle
        cell.textLabel?.text = "\(indexPath.row)"       // 텍스트 추가
        cell.detailTextLabel?.text = indexPath.description  // 디테일 텍스트 추가
        cell.imageView?.image = UIImage(named: "give-love.png")!    // 이미지 추가
        return cell
         */
        
        /* tableView custom cell */
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        return cell
    }
}

