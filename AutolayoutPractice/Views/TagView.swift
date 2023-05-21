//
//  TagView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 28.04.23.
//

import UIKit

protocol TagViewDelegate: AnyObject {
    func didTapClose(for viewIdentifier: String)
    func didSelectView(with identifier: String)
}

class TagView: UIView, NibLoadableView {
    
    // MARK: - Properties
    private var model: TagModel?
    private var isSelected = false
    
    private var selectedStateTextColor: UIColor = .brandMainColor!
    private var selectedStateBackgroundColor: UIColor = .greyscale10!
    private var normalStateTextColor: UIColor = .greyscale100!
    private var normalStateBackgroundColor: UIColor = .brandWhite!
    private(set) var identifier = ""
    
    var isSelectable = false {
        didSet {
            if model!.isSelectable {
                let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
                addGestureRecognizer(tap)
                setUpBorder(color: .greyscale10, width: 1)
            }
        }
    }
    
    weak var delegate: TagViewDelegate?
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var containerVIew: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBOutlet private weak var stackViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var stackViewTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - Initializers
    
    init(with model: TagModel) {
        super.init(frame: .zero)
        self.model = model
        loadFromXib()
        configure(with: model)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromXib()
    }
    
    // MARK: - Methods
    
    func configure(with model: TagModel) {
        self.model = model
        identifier = model.labelText
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
    
    @objc private func didTapView() {
        if !isSelected {
            selectView()
        }
    }
    
    func viewEnterForeground() {
        isSelected = true
        delegate?.didSelectView(with: identifier)
        updateViewSelectionState()
    }
    
    func deselect() {
        isSelected = false
        updateViewSelectionState()
    }
    
    private func selectView() {
        isSelected = !isSelected
        updateViewSelectionState()
        delegate?.didSelectView(with: identifier)
    }
    
    private func updateViewSelectionState() {
        textLabel.textColor = isSelected ? selectedStateTextColor : normalStateTextColor
        containerVIew.backgroundColor = isSelected ? selectedStateBackgroundColor : normalStateBackgroundColor
    }
}

// MARK: - Private Methods
private extension TagView {
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
}

