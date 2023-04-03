//
//  CustomTableViewCell5.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class MorningPainCell: UITableViewCell {
    
    let font1Attribute = [ NSAttributedString.Key.font: UIFont(name: "System Font Regular", size: 12.0)! ]
    let font2Attribute = [ NSAttributedString.Key.font: UIFont(name: "System Font Regular", size: 22.0)! ]

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avgLabel.attributedText = createAttrString()
        iconView.image = UIImage(named: "sun_icon")
        setSecondaryLabelText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func createAttrString() -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: "avg. ",
                                                   attributes: font1Attribute)

        attrString.append(NSMutableAttributedString(string: "7.4",
                                                    attributes: font2Attribute))
        return attrString
    }
    
    func setSecondaryLabelText() {
        let text = "8% lower than last period"
        let attrString = NSMutableAttributedString(string: text)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.alignment = .left

        paragraphStyle.lineBreakMode = .byTruncatingTail

        attrString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        
        secondaryLabel.attributedText = attrString
    }
}
