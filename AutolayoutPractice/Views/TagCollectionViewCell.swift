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
    
    private var isSelectable: Bool? {
        didSet {
            setUpBorder(color: .greyscale10, width: 1)
            if isSelectable! {
                setColorsForStates(normalStateTextColor: .greyscale100!, normalStateBackgroundColor: .brandWhite!, selectedStateTextColor: .brandMainColor!, selectedStateBackgroundColor: .greyscale10!)
            }
        }
    }
    
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var closeButton: ImageOnlyButton!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    
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
        setCloseButtonSize(width: 12, height: 14)
        setCornerRadius(to: 4)
    }
    
    @IBAction func didTapCloseButton(_ sender: Any) {
        delegate?.didTapClose(on: self)
    }
    
    func configureCell(with model: TagModel) {
        textLabel.text = model.labelText
        closeButton.isHidden = !model.hasCloseButton
        isSelectable = model.isSelectable
        if model.isTextCentered {
            centerLabelText()
        }
        configureHorizontalPadding(padding: model.horizontalPadding)
        configureVerticalPadding(padding: model.verticalPadding)
        setLabelFont(to: model.font)
        setLabelTextColor(color: model.textColor)
        setBackGroundColor(to: model.backgroundColor)
    }
}

private extension TagCollectionViewCell {
//    func configureCloseButton() {
//        closeButton.isHidden = false
//    }
    
    func centerLabelText() {
        self.textLabel.textAlignment = .center
    }
    
    func setUpBorder(color: UIColor?, width: CGFloat) {
        if color != nil {
            self.layer.borderColor = color!.cgColor
            self.layer.borderWidth = width
        }
    }
    
    func configureVerticalPadding(padding: CGFloat) {
        stackViewTopConstraint.constant = padding
        stackViewBottomConstraint.constant = padding
    }
    
    func configureHorizontalPadding(padding: CGFloat) {
        stackViewLeadingConstraint.constant = padding
        stackViewTrailingConstraint.constant = padding
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
    
    func setColorsForStates(normalStateTextColor: UIColor, normalStateBackgroundColor: UIColor, selectedStateTextColor: UIColor, selectedStateBackgroundColor: UIColor) {
        self.normalStateTextColor = normalStateTextColor
        self.normalStateBackgroundColor = normalStateBackgroundColor
        self.selectedStateTextColor = selectedStateTextColor
        self.selectedStateBackgroundColor = selectedStateBackgroundColor
    }
    
    func setCloseButtonSize(width: CGFloat, height: CGFloat) {
        closeButton.imageView?.contentMode = .center
        closeButton.imageView?.widthAnchor.constraint(equalToConstant: 12).isActive = true
        closeButton.imageView?.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}
