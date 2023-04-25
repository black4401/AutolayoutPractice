//
//  CustomView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class CustomPainView: UIView {
    
    private let textFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 12.0)! ]
    private let numberFontAttribute = [ NSAttributedString.Key.font: UIFont(name: "DMSans-Bold", size: 22.0)! ]
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        convenienceInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        convenienceInit()
    }
    
    func convenienceInit() {
        let view = Bundle.main.loadNibNamed("CustomPainView", owner: self, options: nil)![0] as! UIView
        addSubview(view)
    }
    
    func configure(with style: PainMonitorCellStyle) {
        setUpAvgLabel(value: style.percentValue)
        setSecondaryLabelText(text: style.secondaryText)
        setUpPainLabel(text: style.painText)
        setUpIconView(iconName: style.emojiName)
    }
}

private extension CustomPainView {
    func createAttrString(value: String) -> NSMutableAttributedString {
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
        mainLabel.textColor = .greyscale80
        mainLabel.font = .dmSansRegular(ofSize: 11)
        mainLabel.text = text
    }
    
    func setUpIconView(iconName: String) {
        iconImageView.image = UIImage(named: iconName)
    }
}
