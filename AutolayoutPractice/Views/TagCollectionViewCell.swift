//
//  TagCollectionViewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 12.04.23.
//

import UIKit

protocol TagCollectionViewCellDelegate: AnyObject {
    func didTapClose(on cell: TagCollectionViewCell)
}

class TagCollectionViewCell: UICollectionViewCell {
    
    private var normalStateTextColor: UIColor?
    private var normalStateBackgroundColor: UIColor?
    private var selectedStateTextColor: UIColor?
    private var selectedStateBackgroundColor: UIColor?
    
    @IBOutlet private weak var leadingToTextLabelConstraint: NSLayoutConstraint!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var closeButton: ImageOnlyButton!
    
    weak var delegate: TagCollectionViewCellDelegate?
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                guard selectedStateTextColor != nil && selectedStateBackgroundColor != nil else {
                    return
                }
                self.backgroundColor = selectedStateBackgroundColor
                self.textLabel.textColor = selectedStateTextColor
            } else {
                guard normalStateTextColor != nil && normalStateBackgroundColor != nil else {
                    return
                }
                self.backgroundColor = normalStateBackgroundColor
                self.textLabel.textColor = normalStateTextColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        closeButton.isHidden = true
    }

    @IBAction func didTapCloseButton(_ sender: Any) {
        delegate?.didTapClose(on: self)
    }
    
    func setColorsForStates(normalStateTextColor: UIColor, normalStateBackgroundColor: UIColor, selectedStateTextColor: UIColor, selectedStateBackgroundColor: UIColor) {
        self.normalStateTextColor = normalStateTextColor
        self.normalStateBackgroundColor = normalStateBackgroundColor
        self.selectedStateTextColor = selectedStateTextColor
        self.selectedStateBackgroundColor = selectedStateBackgroundColor
    }
    
    func setLabelText(text: String) {
        textLabel.text = text
    }
    
    func setLabelFont(to font: UIFont) {
        textLabel.font = font
    }
    
    func setBackGroundColor(to color: UIColor?) {
        if color != nil {
            self.backgroundColor = color
        }
    }
    
    func setLabelTextColor(color: UIColor?) {
        if color != nil {
            self.textLabel.textColor = color
        }
    }
    
    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func centerLabelText() {
        self.textLabel.textAlignment = .center
    }
    
    func configureCloseButton() {
        closeButton.isHidden = false
    }
    
    func setUpBorder(color: UIColor?, width: CGFloat) {
        if color != nil {
            self.layer.borderColor = color!.cgColor
            self.layer.borderWidth = width
        }
    }
    
    func setConstraintLeadingToTextLabel(value: CGFloat) {
        self.leadingToTextLabelConstraint.constant = value
    }
    
    func configureCell(with model: PainLocationTagModel) {
        textLabel.text = model.textForLabel
        if model.hasCloseButton {
            closeButton.isHidden = false
        }
    }
}
