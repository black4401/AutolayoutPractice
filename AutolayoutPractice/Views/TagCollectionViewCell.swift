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
    
    var normalStateTextColor: UIColor?
    var normalStateBackgroundColor: UIColor?
    var selectedStateTextColor: UIColor?
    var selectedStateBackgroundColor: UIColor?
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var closeButton: ImageOnlyButton!
    
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
}
