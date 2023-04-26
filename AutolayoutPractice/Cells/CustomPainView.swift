//
//  CustomView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class CustomPainView: UIView {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var avgLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
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
        setUpAvgLabel()
        setSecondaryLabelText(text: style.secondaryText)
        setUpPainLabel(text: style.painText)
        setUpIconView(iconName: style.emojiName)
    }
}

private extension CustomPainView {
    
    func setUpAvgLabel() {
        avgLabel.text = "avg. "
        avgLabel.font = .dmSansRegular(ofSize: 12)
        avgLabel.textColor = .greyscale100
    }
    
    func setUpNumberLabel(text: String) {
        numberLabel.text = text
        numberLabel.font = .dmSansBold(ofSize: 22)
        numberLabel.textColor = .brandMainColor
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
        mainLabel.font = .dmSansBold(ofSize: 11)
        mainLabel.text = text
    }
    
    func setUpIconView(iconName: String) {
        iconImageView.image = UIImage(named: iconName)
    }
}
