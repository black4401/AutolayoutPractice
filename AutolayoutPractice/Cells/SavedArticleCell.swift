//
//  CustomTableViewCell7.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class SavedArticleCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var recommendedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpMainLabel()
        setUpSecondaryLabel()
        setUpRecommendedLabel()
        
        iconImageView.image = UIImage(named: "Rectangle 127")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpMainLabel() {
        mainLabel.font = .dmSansRegular(ofSize: 15)
        mainLabel.text = "Move more, live better: How moving your body changes your brain"
        mainLabel.textColor = .brandMainColor
    }
    
    private func setUpSecondaryLabel() {
        secondaryLabel.font = .dmSansRegular(ofSize: 12)
        secondaryLabel.text = "Jan 30, 2020 • 01:24 mins"
        secondaryLabel.textColor = .greyscale100
    }
    
    private func setUpRecommendedLabel() {
        recommendedLabel.layer.cornerRadius = 4
        recommendedLabel.clipsToBounds = true
        recommendedLabel.backgroundColor = .brandAccentTitn
        recommendedLabel.text = "RECOMMENDED"
        recommendedLabel.textColor = .greyscale140
        recommendedLabel.setFontToSourceSansPro(with: 11)
    }
}
