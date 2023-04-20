//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class PainRateCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var innerImageView: UIImageView!
    @IBOutlet weak var lineImageView: UIImageView!
    
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var painLabel: UILabel!
    @IBOutlet weak var severitylabel: UILabel!
    @IBOutlet weak var painLocationLabel: UILabel!
    
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var editButton: ImageOnlyButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setUpCollectionView()
        
        setUpPainLabel()
        setUpMorningLabel()
        setUpSeverityLabel()
        
        backView.layer.cornerRadius = 12
        iconImageView.image = UIImage(named: "sun_icon")
        emojiImageView.image = UIImage(named: "Progress")
        innerImageView.image = UIImage(named: "anguish")
        circleView.layer.cornerRadius = 25
        editButton.setImage(UIImage(named: "edit_icon 1"), for: .normal)
        lineImageView.image = UIImage(named: "Line 13")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpCollectionView() {
        cellCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tagCellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 146, height: 28)
        layout.minimumInteritemSpacing = 4

        cellCollectionView.collectionViewLayout =  layout
    }
}

private extension PainRateCell {
    func setUpPainLabel() {
        painLabel.text = "Pain rate (up to 8)"
        painLabel.setFontToDMSans(with: 17)
        painLabel.textColor = .greyscale140
    }
    
    func setUpMorningLabel() {
        morningLabel.text = "MORNING"
        morningLabel.setFontToDMSans(with: 11)
        morningLabel.textColor = .greyscale80
    }
    
    func setUpSeverityLabel() {
        severitylabel.text = "Severe"
        severitylabel.setFontToDMSans(with: 15)
        severitylabel.textColor = .greyscale120
    }
}
