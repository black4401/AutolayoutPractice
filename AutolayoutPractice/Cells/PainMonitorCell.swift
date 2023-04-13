//
//  PainMonitorCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 5.04.23.
//

import UIKit

class PainMonitorCell: UITableViewCell {

    let textFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 12.0)! ]
    let numberFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 22.0)! ]
    
    @IBOutlet private weak var morningPainLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var avgLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!
    
}

 extension PainMonitorCell {
    private func createAttrString(value: String) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: "avg. ",
                                                   attributes: textFontAttribute)

        attrString.append(NSMutableAttributedString(string: value,
                                                    attributes: numberFontAttribute))
        return attrString
    }
     
     func setUpAvgLabel(value: String) {
         avgLabel.attributedText = createAttrString(value: value)
         avgLabel.textColor = .greyscale100
     }
    
    func setSecondaryLabelText(text: String) {
        secondaryLabel.font = .dmSansRegular(ofSize: 15)
        secondaryLabel.textColor = .greyscale100
        let text = text
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.alignment = .left

        paragraphStyle.lineBreakMode = .byTruncatingTail

        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        
        secondaryLabel.attributedText = attrString
    }
    
    func setUpPainLabel(text: String) {
        morningPainLabel.textColor = .greyscale80
        morningPainLabel.font = .dmSansRegular(ofSize: 11)
        morningPainLabel.text = text
    }
    
    func setUpIconView(iconName: String) {
        iconImageView.image = UIImage(named: iconName)
    }
}
