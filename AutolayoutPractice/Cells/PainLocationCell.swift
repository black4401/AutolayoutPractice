//
//  PainLocationCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 13.04.23.
//

import UIKit

class PainLocationCell: UITableViewCell {
    
    var collectionViewModels: [TagModel] = [] {
        didSet {
            continueButton.titleLabel?.text = "Continue"
            horizontalScrollView.data = collectionViewModels
        }
    }
    
    @IBOutlet weak var horizontalScrollView: HorizontalScrollView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpMainLabel()
        setUpContinueButton()
    }
    
    func setUpMainLabel() {
        mainLabel.text = "Where do you feel pain?"
        mainLabel.setFontToDMSans(with: 17)
        mainLabel.textColor = .brandMainColor
    }
    
    func setUpContinueButton() {
        continueButton.titleLabel?.text = "Continue (\(collectionViewModels.count))"
        continueButton.backgroundColor = .brandMainColor
        continueButton.titleLabel?.textColor = .brandWhite
        continueButton.layer.cornerRadius = 4
        continueButton.clipsToBounds = true
    }
}

