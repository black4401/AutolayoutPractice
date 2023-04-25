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
        let model = collectionViewModels[indexPath.row]
        cell.configureCell(with: collectionViewModels[indexPath.row])
        cell.delegate = model.hasCloseButton ? self : nil
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let model = collectionViewModels[indexPath.row]
        let spaceForButton = model.hasCloseButton ? 10 : 0
        label.text = collectionViewModels[indexPath.row].labelText
        let size = label.sizeThatFits(CGSize(width: 200, height: 100))
        return CGSize(width: size.width + CGFloat(spaceForButton) + model.horizontalPadding*2, height: size.height + model.verticalPadding*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return collectionViewModels[indexPath.row].isSelectable
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
