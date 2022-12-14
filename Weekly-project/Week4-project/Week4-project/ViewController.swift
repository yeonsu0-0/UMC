//
//  ViewController.swift
//  Week4-project
//
//  Created by yeonsu on 2022/11/02.
//

import UIKit

/* ๐ TableView DataSource & Delegate */

// UITableViewDelegate: ํ์ด๋ธ ๋ทฐ์์ section์ header, footer๋ฅผ ๊ด๋ฆฌํ๊ณ  ์์ ์ญ์ ํ๊ฑฐ๋ ์์น๋ฅผ ๋ฐ๊พธ๊ณ  ๊ทธ ์ธ์ ๋ค๋ฅธ ์์์ ์ํํ๊ธฐ ์ํ ๋ฉ์๋๋ฅผ ์ ๊ณตํ๋ค / ํ์ด๋ธ๋ทฐ์ ์๊ฐ์ ์ธ ๋ถ๋ถ์ ์์ ํด์ฃผ๊ณ , ํ์ด๋ธ ๋ทฐ์ ๊ฐ๋ณ ํ ํธ์ง ๋ฑ์ ๋์์ฃผ๋ ์ญํ ์ ํ๋ค

// UITableViewDataSource: ํ์ด๋ธ ๋ทฐ์ ์์ ์ฌ์ฉ๋๋ ๋ฐ์ดํฐ๋ฅผ ๊ด๋ฆฌํ๊ธฐ ์ํ ๋ฉ์๋๋ฅผ ์ ๊ณตํ๋ค / ํ์ด๋ธ๋ทฐ๋ฅผ ์์ฑํ๊ณ  ์์ ํ๋๋ฐ ํ์ํ ์ ๋ณด๋ฅผ ํ์ด๋ธ๋ทฐ ๊ฐ์ฒด์ ์ ๊ณตํ๋ ์ญํ ์ ํ๋ค

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

    // ๐ instantiateViewController: Creates the specified view controller from the storyboard and initializes it using your custom initialization code.
    
    // ๐ pushViewController: Pushes a view controller onto the receiverโs stack and updates the display. ๋ค๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ๋ VC๋ค์ ์คํ์ผ๋ก ๊ด๋ฆฌํ๊ธฐ ๋๋ฌธ์ push, pop ๋ฉ์๋๋ฅผ ์ฌ์ฉํ๋ค. pushViewController๋ฉ์๋๋ ์คํ์ VC๋ฅผ ์ถ๊ฐํ๋ ๋ฉ์๋์ด๋ฉฐ, ์คํ์์ ์ต ์์์ ์๋ VC๊ฐ ํ์ฌ ํ๋ฉด์ ํ์๋๋ VC๊ฐ ๋๋ค.

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
    
    // numberOfRowsInSection: ๊ฐ ์น์์ ํ์ํ  ํ์ ๊ฐ์(@required by UITableViewDataSource)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count     // ํ์ ๊ฐ์: ํํ์ ๊ฐ์๋ก ์ง์ 
    }
    
    // cellForRowAt: ํน์  ์์น์ ํ์ํ  ์ ์์ฒญ(@required by UITableViewDataSource)
    // dequeueReusableCell: [withIdentifier: ์ฌ์ฌ์ฉํ  ๊ฐ์ฒด๋ฅผ ๋ํ๋ด๋ ๋ฌธ์์ด], [indexPath: ์์ ์์น๋ฅผ ์๋ ค์ค]
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    // didSelectRowAt: ์ง์ ๋ ํ์ด ์ ํ๋์์์ ์๋ ค์ฃผ๋ ๋ฉ์๋, ํด๋น ํ์ด ๋๋ ธ์ ๋ ํํด์ง ํ์์ ๋ํ ์ฝ๋๋ฅผ ๊ตฌํ
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
            
            
            
            /* ์๋ฌ ๋ฐ์: Invalid update: invalid number of rows in section 0. The number of rows contained in an existing section after the update (1) must be equal to the number of rows contained in that section before the update (1) */
            
            
            
            // ํด๊ฒฐ: ๋ฐ์ดํฐ๋ฅผ ๋จผ์  ์ง์ฐ๊ณ  ๋ ๋ค์ ํ์ด๋ธ cell์ ์ญ์ ํ๋ค
            
            models.remove(at: indexPath.row)    //๋ฐ์ดํฐ ์ญ์ 
            
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)      // ํ์ด๋ธ cell ์ญ์ 
            
            tableView.endUpdates()
            
        }
        
    }
}
