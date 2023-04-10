//
//  CustomConfigurableView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 10.04.23.
//

import UIKit

class CustomConfigurableView: UIView {
    
    let textLabel = UILabel()
    let closeButton = UIButton(type: .system)
    
    var cornerRadius: CGFloat = 4
    var verticalPadding: CGFloat = 8
    var horizontalPadding: CGFloat = 16
    
    var supportsSelection = false
    var isSelected = false {
        didSet {
            updateColors()
        }
    }
    
    var backgroundColorForNormalState = UIColor.white
    var backgroundColorForSelectedState = UIColor.red
    var textColorForNormalState = UIColor.greyscale140
    var textColorForSelectedState = UIColor.white
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpForPainRateCell(with: "text")
        //setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpForPainRateCell(with text: String) {
        layer.cornerRadius = 4
        clipsToBounds = true
        
        textLabel.text = text
        textLabel.setFontToDMSans(with: 15)
        textLabel.textColor = .greyscale140
        textLabel.textAlignment = .center
        textLabel.backgroundColor = .yellow10
        addSubview(textLabel)
    }
    
    private func setup() {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        //textLabel.font = titleFont
        textLabel.textColor = textColorForNormalState
        textLabel.textAlignment = .center
        addSubview(textLabel)
        
        closeButton.setTitle("X", for: .normal)
        closeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        addSubview(closeButton)
        
        updateColors()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let closeButtonSize = CGSize(width: 24, height: 24)
        closeButton.frame = CGRect(x: bounds.width - closeButtonSize.width - horizontalPadding, y: verticalPadding, width: closeButtonSize.width, height: closeButtonSize.height)
        
        let textLabelFrame = CGRect(x: horizontalPadding, y: verticalPadding, width: bounds.width - 2 * horizontalPadding - closeButtonSize.width, height: bounds.height - 2 * verticalPadding)
        textLabel.frame = textLabelFrame
    }
    
    func setSelected(_ selected: Bool) {
        isSelected = selected
        updateColors()
    }
    
    private func updateColors() {
        backgroundColor = isSelected ? backgroundColorForSelectedState : backgroundColorForNormalState
        textLabel.textColor = isSelected ? textColorForSelectedState : textColorForNormalState
    }
    
    @objc private func closeButtonTapped(_ sender: UIButton) {
        removeFromSuperview()
    }
    
    @objc private func viewTapped(_ sender: UITapGestureRecognizer) {
        if supportsSelection {
            superview?.subviews.compactMap { $0 as? CustomConfigurableView }.forEach { $0.isSelected = false }
            isSelected = true
        }
    }
}