//
//  PainLocationCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 13.04.23.
//

import UIKit

class PainLocationCell: UITableViewCell {
    
    // MARK: - Properties
    
    var collectionViewModels: [TagModel] = [] {
        didSet {
            continueButton.titleLabel?.text = "Continue"
            horizontalScrollView.data = collectionViewModels
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var horizontalScrollView: HorizontalScrollView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var continueButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpMainLabel()
        setUpContinueButton()
    }
    
    // MARK: - Private Methods
    
    private func setUpMainLabel() {
        mainLabel.text = "Where do you feel pain?"
        mainLabel.font = .dmSansRegular(ofSize: 17)
        mainLabel.textColor = .brandMainColor
    }
    
    private func setUpContinueButton() {
        continueButton.titleLabel?.text = "Continue (\(collectionViewModels.count))"
        continueButton.backgroundColor = .brandMainColor
        continueButton.titleLabel?.textColor = .brandWhite
        continueButton.layer.cornerRadius = 4
        continueButton.clipsToBounds = true
    }
}

