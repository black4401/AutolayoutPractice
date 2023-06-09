//
//  CustomTableViewCell7.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class SavedArticleCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    @IBOutlet private weak var recommendedLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpMainLabel()
        setUpSecondaryLabel()
        setUpRecommendedLabel()
        
        iconImageView.image = UIImage(named: "Rectangle 127")
    }
    
    // MARK: - Private Methods
    
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
        recommendedLabel.text = " RECOMMENDED  "
        recommendedLabel.textColor = .greyscale140
        recommendedLabel.font = .sourceSansPro(ofSize: 11)
    }
}
