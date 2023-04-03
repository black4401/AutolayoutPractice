//
//  CustomTableViewCell7.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class SavedArticleCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainLabel.text = "Move more, live better: How moving your body changes your brain"
        secondaryLabel.text = "Jan 30, 2020 * 4 mins"
        iconView.image = UIImage(named: "Rectangle 127")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
