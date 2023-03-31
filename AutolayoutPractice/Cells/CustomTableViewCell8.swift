//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class CustomTableViewCell8: UITableViewCell {
    
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var emojiView: UIImageView!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var painLabel: UILabel!
    @IBOutlet weak var severitylabe: UILabel!
    @IBOutlet weak var painLocationLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var editIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 12
        iconView.image = UIImage(named: "sun_icon")
        emojiView.image = UIImage(named: "emoji_progress_icon")
        circleView.layer.cornerRadius = 25
        editIcon.image = UIImage(named: "edit_icon 1")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
