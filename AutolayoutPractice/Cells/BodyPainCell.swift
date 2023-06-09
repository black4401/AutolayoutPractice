//
//  BodyPainCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 12.04.23.
//

import UIKit

class BodyPainCell: UITableViewCell {
    
    // MARK: - Properties
    
    var collectionViewModels: [TagModel] = [] {
        didSet {
            horizontalScrollView.data = collectionViewModels
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var morningLabel: UILabel!
    @IBOutlet private weak var eveningLabel: UILabel!
    @IBOutlet private weak var horizontalScrollView: HorizontalScrollView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerLabel.font = UIFont.dmSansRegular(ofSize: 15)
        headerLabel.textColor = .brandMainColor
        mainLabel.font = UIFont.dmSansRegular(ofSize: 15)
        mainLabel.textColor = .greyscale100
    }
}

