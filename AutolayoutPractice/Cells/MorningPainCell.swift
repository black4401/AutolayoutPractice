//
//  CustomTableViewCell5.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class MorningPainCell: UITableViewCell {
    
    let textFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 12.0)! ]
    let numberFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 22.0)! ]

    @IBOutlet weak var morningPainLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
        avgLabel.attributedText = createAttrString()
        avgLabel.textColor = .greyscale100
        
        iconImageView.image = UIImage(named: "sun_icon")
        
        setSecondaryLabelText()
        setUpMorningPainLabel()
    }
}

private extension MorningPainCell {
    func createAttrString() -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: "avg. ",
                                                   attributes: textFontAttribute)

        attrString.append(NSMutableAttributedString(string: "7.4",
                                                    attributes: numberFontAttribute))
        return attrString
    }
    
    func setSecondaryLabelText() {
        secondaryLabel.font = .dmSansRegular(ofSize: 15)
        secondaryLabel.textColor = .greyscale100
        let text = "8% lower than last period"
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.alignment = .left

        paragraphStyle.lineBreakMode = .byTruncatingTail

        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        
        secondaryLabel.attributedText = attrString
    }
    
    func setUpMorningPainLabel() {
        morningPainLabel.textColor = .greyscale80
        morningPainLabel.font = .dmSansRegular(ofSize: 11)
        morningPainLabel.text = "MORNING PAIN"
    }
}
