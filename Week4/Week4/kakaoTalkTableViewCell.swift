//
//  kakaoTalkTableViewCell.swift
//  Week4
//
//  Created by yeonsu on 2022/10/27.
//

import UIKit

class kakaoTalkTableViewCell: UITableViewCell {
    @IBOutlet weak var messageCountLabel: UILabel!
    @IBOutlet weak var messageCountBgView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
 

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 17.5
        messageCountBgView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // prepareForReuse(): 재사용되는 cell의 속성 초기화
    // 따로 호출하지 않아도 cell이 재사용될 때 자동으로 background 설정 가능
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
    }
}
