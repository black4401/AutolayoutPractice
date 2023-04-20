//
//  PainLocationCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 13.04.23.
//

import UIKit

class PainLocationCell: UITableViewCell {
    
    var collectionViewModels: [PainLocationTagModel] = [] {
        didSet {
            continueButton.titleLabel?.text = "Continue (\(collectionViewModels.count))"
        }
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    func setUpCollectionView() {
        cellCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tagCellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        
        cellCollectionView.collectionViewLayout =  layout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellCollectionView.dataSource = self
        cellCollectionView.delegate = self
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
        continueButton.titleLabel?.text = "Continue (\(collectionViewModels.count))"
        continueButton.backgroundColor = .brandMainColor
        continueButton.titleLabel?.textColor = .brandWhite
        continueButton.layer.cornerRadius = 4
        continueButton.clipsToBounds = true
    }
}

extension PainLocationCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, TagCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cellCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
        cell.configureCell(with: collectionViewModels[indexPath.row])
        cell.delegate = self
        cell.setLabelFont(to: UIFont.dmSansRegular(ofSize: 15))
        cell.setLabelTextColor(color: .greyscale140)
        cell.setBackGroundColor(to: .greyscale05)
        cell.setCornerRadius(to: 4)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = collectionViewModels[indexPath.row].textForLabel
        let size = label.sizeThatFits(CGSize(width: 200, height: 100))
        return CGSize(width: size.width + 20, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func didTapClose(on cell: TagCollectionViewCell) {
        
        if let indexPath = self.cellCollectionView.indexPath(for: cell) {
            self.cellCollectionView.performBatchUpdates {
                collectionViewModels.remove(at: indexPath.item)
                self.cellCollectionView.deleteItems(at: [indexPath])
            }
        }
    }
}
