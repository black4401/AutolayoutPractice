//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class PainRateCell: UITableViewCell {
    
    var collectionViewModels: [TagModel] = [] {
        didSet {
            horizontalScrollView.data = collectionViewModels
        }
    }
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var emojiImageView: UIImageView!
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var circleView: UIView!
    @IBOutlet private weak var innerImageView: UIImageView!
    @IBOutlet private weak var lineImageView: UIImageView!
    
    @IBOutlet private weak var morningLabel: UILabel!
    @IBOutlet private weak var painLabel: UILabel!
    @IBOutlet private weak var severitylabel: UILabel!
    @IBOutlet private weak var painLocationLabel: UILabel!
    
    @IBOutlet private weak var editButton: ImageOnlyButton!
    @IBOutlet private weak var horizontalScrollView: HorizontalScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setUpPainLabel()
        setUpMorningLabel()
        setUpSeverityLabel()
        
        backView.layer.cornerRadius = 12
        iconImageView.image = UIImage(named: "sun_icon")
        emojiImageView.image = UIImage(named: "Progress")
        innerImageView.image = UIImage(named: "anguish")
        circleView.layer.cornerRadius = 25
        editButton.setImage(UIImage(named: "edit_icon 1"), for: .normal)
        lineImageView.image = UIImage(named: "Line 13")
    }
}

private extension PainRateCell {
    func setUpPainLabel() {
        painLabel.text = "Pain rate (up to 8)"
        painLabel.setFontToDMSans(with: 17)
        painLabel.textColor = .greyscale140
    }
    
    func setUpMorningLabel() {
        morningLabel.text = "MORNING"
        morningLabel.setFontToDMSans(with: 11)
        morningLabel.textColor = .greyscale80
    }
    
    func setUpSeverityLabel() {
        severitylabel.text = "Severe"
        severitylabel.setFontToDMSans(with: 15)
        severitylabel.textColor = .greyscale120
    }
}
