//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class PainRateCell: UITableViewCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var emojiView: UIImageView!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var painLabel: UILabel!
    @IBOutlet weak var severitylabe: UILabel!
    @IBOutlet weak var painLocationLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var editIcon: UIImageView!
    @IBOutlet weak var innerImageView: UIImageView!
    @IBOutlet weak var lineView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 12
        iconView.image = UIImage(named: "sun_icon")
        emojiView.image = UIImage(named: "Progress")
        innerImageView.image = UIImage(named: "anguish")
        circleView.layer.cornerRadius = 25
        editIcon.image = UIImage(named: "edit_icon 1")
        lineView.image = UIImage(named: "Line 13")
        
        painLocationLabel.layer.cornerRadius = 6
        painLocationLabel.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
