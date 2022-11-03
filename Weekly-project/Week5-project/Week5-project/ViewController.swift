//
//  ViewController.swift
//  Week4-project
//
//  Created by yeonsu on 2022/11/02.
//

import UIKit

/* 📌 TableView DataSource & Delegate */

// UITableViewDelegate: 테이블 뷰에서 section의 header, footer를 관리하고 셀을 삭제하거나 위치를 바꾸고 그 외의 다른 작업을 수행하기 위한 메서드를 제공한다 / 테이블뷰의 시각적인 부분을 수정해주고, 테이블 뷰의 개별 행 편집 등을 도와주는 역할을 한다

// UITableViewDataSource: 테이블 뷰의 셀에 사용되는 데이터를 관리하기 위한 메서드를 제공한다 / 테이블뷰를 생성하고 수정하는데 필요한 정보를 테이블뷰 객체에 제공하는 역할을 한다

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    // Tuple
    lazy var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }

    // 📌 instantiateViewController: Creates the specified view controller from the storyboard and initializes it using your custom initialization code.
    
    // 📌 pushViewController: Pushes a view controller onto the receiver’s stack and updates the display. 네비게이션 컨트롤러는 VC들을 스택으로 관리하기 때문에 push, pop 메소드를 사용한다. pushViewController메소드는 스택에 VC를 추가하는 메소드이며, 스택에서 최 상위에 있는 VC가 현재 화면에 표시되는 VC가 된다.

    // Create new note
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {return}
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {noteTitle, note in
            self.models.append((title: noteTitle, note: note))
            self.navigationController?.popViewController(animated: true)
            self.label.isHidden = true
            self.table.isHidden = false
            
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Table
    
    // numberOfRowsInSection: 각 섹션에 표시할 행의 개수(@required by UITableViewDataSource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count     // 행의 개수: 튜플의 개수로 지정
    }
    
    // cellForRowAt: 특정 위치에 표시할 셀 요청(@required by UITableViewDataSource)
    // dequeueReusableCell: [withIdentifier: 재사용할 객체를 나타내는 문자열], [indexPath: 셀의 위치를 알려줌]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    // didSelectRowAt: 지정된 행이 선택되었음을 알려주는 메서드, 해당 행이 눌렸을 때 행해질 행위에 대한 코드를 구현
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = models[indexPath.row]
        
        // Show note controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else { return }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            tableView.beginUpdates()

            /* 에러 발생: Invalid update: invalid number of rows in section 0. The number of rows contained in an existing section after the update (1) must be equal to the number of rows contained in that section before the update (1) */

            // 해결: 데이터를 먼저 지우고 난 뒤에 테이블 cell을 삭제한다
            
            models.remove(at: indexPath.row)    //데이터 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)      // 테이블 cell 삭제
            tableView.endUpdates()
            
        }
        
    }
}
