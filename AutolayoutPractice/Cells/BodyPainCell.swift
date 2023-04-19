//
//  BodyPainCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 12.04.23.
//

import UIKit

fileprivate let cellIdentifier = "tagCell"

class BodyPainCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var eveningLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: [TagModel] = [TagModel(textLabel: "Overall", labelWidth: 65), TagModel(textLabel: "Front of right head", labelWidth: 141), TagModel(textLabel: "Right face", labelWidth: 85)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        setUpCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setBackGroundColor(to: .brandWhite)
        cell.setCornerRadius(to: 6)
        cell.setLabelFont(to: UIFont.dmSansRegular(ofSize: 15))
        cell.setLabelTextColor(color: .greyscale100)
        cell.centerLabelText()
        cell.setLabelText(text: dataSource[indexPath.item].textLabel)
        cell.setUpBorder(color: UIColor.greyscale10, width: 1)
        cell.setColorsForStates(normalStateTextColor: .greyscale100!, normalStateBackgroundColor: .brandWhite!, selectedStateTextColor: .brandMainColor!, selectedStateBackgroundColor: .greyscale10!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: dataSource[indexPath.item].labelWidth, height: 28)
    }
    
    func setUpCollectionView() {
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 146, height: 28)
        layout.minimumInteritemSpacing = 4
        
        collectionView.collectionViewLayout =  layout
    }
}

extension BodyPainCell {
    struct TagModel {
        let textLabel: String
        let labelWidth: CGFloat
        
        init(textLabel: String, labelWidth: CGFloat) {
            self.textLabel = textLabel
            self.labelWidth = labelWidth
        }
    }
}

