//
//  tableViewController.swift
//  Week4
//
//  Created by yeonsu on 2022/10/27.
//

import UIKit

class tableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDataSource 프로토콜 채택 시 필수 구현!
    // 셀의 개수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingRoomData.count
    }
    
    // UITableViewDataSource 프로토콜 채택 시 필수 구현!
    // 테이블 View에 넣을 Cell return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Cell에 접근해서 데이터 변경
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "kakaoTalkTableViewCell", for: indexPath) as? kakaoTalkTableViewCell else {return UITableViewCell()}
        
        cell.nameLabel.text = chattingRoomData[indexPath.row].name
        
        cell.profileImageView.image = chattingRoomData[indexPath.row].profileImage

        cell.lastMessageLabel.text = chattingRoomData[indexPath.row].lastMessage
        
        if let memberCount = chattingRoomData[indexPath.row].memberCount {
            cell.memberCountLabel.text = memberCount
        } else {
            cell.memberCountLabel.isHidden = true
        }
        
        cell.timeLabel.text = chattingRoomData[indexPath.row].time
        cell.messageCountLabel.text = chattingRoomData[indexPath.row].messageCount
        
        // cell 재사용큐 활용 시 문제점 발생
        if indexPath.row == 1 {
            cell.backgroundColor = .red
        }   // 스크롤 하다보면 빨간색이 점점 늘어남(컬러도 재활용되기 때문)
        
        return cell;
    }
    
    
    @IBOutlet weak var kakaoTalkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 필수!
        kakaoTalkTableView.delegate = self
        kakaoTalkTableView.dataSource = self
    }
    
    let chattingRoomData: [ChattingRoomDataModel] = [ChattingRoomDataModel(profileImage: UIImage(named: "swiftIcon"), name: "iOS 단톡방", lastMessage: "사진을 보냈습니다.", memberCount: "200", time: "오전 1:05", messageCount: "61"), ChattingRoomDataModel(profileImage: UIImage(named: "swiftIcon"), name: "iOS 단톡방", lastMessage: "사진을 보냈습니다.", memberCount: "200", time: "오전 1:05", messageCount: "61"), ChattingRoomDataModel(profileImage: UIImage(named: "swiftIcon"), name: "iOS 단톡방", lastMessage: "사진을 보냈습니다.", memberCount: "200", time: "오전 1:05", messageCount: "61")]
}

// Cell에 들어가는 데이터 모델을 구조체로 정의
struct ChattingRoomDataModel {
    let profileImage: UIImage?
    let name: String
    let lastMessage: String
    let memberCount: String?
    let time: String
    let messageCount: String
}
