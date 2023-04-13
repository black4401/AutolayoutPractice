//
//  PainLocationCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 13.04.23.
//

import UIKit

fileprivate let cellIdentifier = "tagCell"

class PainLocationCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    var numberOfTags: Int = 0 {
        didSet {
            continueButton.titleLabel?.text = "Continue (\(numberOfTags))"
        }
    }
    
    var dataSource: [TagModel] = [TagModel(textLabel: "Left big toe", labelWidth: 121), TagModel(textLabel: "Right big toe", labelWidth: 121), TagModel(textLabel: "Left knee cap", labelWidth: 121)]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TagCollectionViewCell
        cell.delegate = self
        cell.textLabel.text = dataSource[indexPath.item].textForLabel
        cell.textLabel.setFontToDMSans(with: 15)
        cell.textLabel.textColor = .greyscale140
        
        cell.closeButton.isHidden = false
        cell.backgroundColor = .greyscale05
        
        numberOfTags+=1
        return cell
    }
    
    func setUpCollectionView() {
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 121, height: 36)
        layout.minimumInteritemSpacing = 4
        
        collectionView.collectionViewLayout =  layout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpMainLabel()
        setUpContinueButton()
        
        collectionView.dataSource = self
        collectionView.delegate = self
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

extension PainLocationCell: TagCollectionViewCellDelegate {
    func didTapClose(on cell: TagCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            dataSource.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
            numberOfTags-=1
        }
    }
}
