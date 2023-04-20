//
//  PainLocationCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 13.04.23.
//

import UIKit

class PainLocationCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    var numberOfTags: Int = 0 {
        didSet {
            continueButton.titleLabel?.text = "Continue (\(numberOfTags))"
        }
    }
    
    func setUpCollectionView() {
        cellCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tagCellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 121, height: 36)
        layout.minimumInteritemSpacing = 4
        
        cellCollectionView.collectionViewLayout =  layout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpMainLabel()
        setUpContinueButton()
        
        setUpCollectionView()
    }
    
    func setUpMainLabel() {
        mainLabel.text = "Where do you feel pain?"
        mainLabel.setFontToDMSans(with: 17)
        mainLabel.textColor = .brandMainColor
    }
    
    func setUpContinueButton() {
        continueButton.backgroundColor = .brandMainColor
        continueButton.titleLabel?.textColor = .brandWhite
        continueButton.layer.cornerRadius = 4
        continueButton.clipsToBounds = true
    }
}

extension PainLocationCell {
    struct TagModel {
        let textForLabel: String
        let labelWidth: CGFloat
        
        init(textLabel: String, labelWidth: CGFloat) {
            self.textForLabel = textLabel
            self.labelWidth = labelWidth
        }
    }
}
