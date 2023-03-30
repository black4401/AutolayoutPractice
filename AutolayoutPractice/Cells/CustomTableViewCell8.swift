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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.image = UIImage(named: "sun_icon")
        emojiView.image = UIImage(named: "emoji_progress_icon")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
