//
//  BodyPainCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 12.04.23.
//

import UIKit

class BodyPainCell: UITableViewCell {
    
    var collectionViewModels: [TagModel] = [] {
        didSet {
            horizontalScrollView.data = collectionViewModels
        }
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var eveningLabel: UILabel!
    
    @IBOutlet weak var horizontalScrollView: HorizontalScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerLabel.font = UIFont.dmSansRegular(ofSize: 15)
        headerLabel.textColor = .brandMainColor
        mainLabel.font = UIFont.dmSansRegular(ofSize: 15)
        mainLabel.textColor = .greyscale100
    }
}

