//
//  ViewController.swift
//  Week6-project
//
//  Created by yeonsu on 2022/11/05.
//

import UIKit
import UserNotifications    // 팝업 알림을 위해 필요

class ViewController: UIViewController {

    @IBOutlet var table: UITableView!
    
    var models = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func didTapAdd() {
        // 알림 생성하기
    }
    
    @IBAction func didTapTest() {
        // 테스트 버튼
        UNUserNotificationCenter.current().requestAuthorization(options: .alert, completionHandler: {success, error in
            if success {
                // 스케쥴 테스트 메소드 실행
                self.scheduleTest()
            }
            else if let error = error {
                print("에러가 발생했습니다")
            }
        })
    }
    func scheduleTest() {
        // 알림 트리거 필요 -> date가 트리거 역할을 함
        let content = UNMutableNotificationContent()
        content.title = "안녕하세요 고객님!"
        content.sound = .default
        content.body = "💌 새로운 알림이 도착했습니다"
        
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            if error != nil {
                print("무언가 잘못됐습니다...") 
            }
        })
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
}


struct Reminder {
    let title: String
    let date: Date
    let identifier: String
}


