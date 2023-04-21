//
//  BodyPainCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 12.04.23.
//

import UIKit

class BodyPainCell: UITableViewCell {
    
    var collectionViewModels: [TagModel] = []
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var morningLabel: UILabel!
    @IBOutlet weak var eveningLabel: UILabel!
    
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCollectionView()
        cellCollectionView.dataSource = self
        cellCollectionView.delegate = self
        
        headerLabel.font = UIFont.dmSansRegular(ofSize: 15)
        headerLabel.textColor = .brandMainColor
        mainLabel.font = UIFont.dmSansRegular(ofSize: 15)
        mainLabel.textColor = .greyscale100
    }
    
    func setUpCollectionView() {
        cellCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.tagCellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4

        cellCollectionView.collectionViewLayout =  layout
    }
}

extension BodyPainCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cellCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
        let model = collectionViewModels[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let model = collectionViewModels[indexPath.row]
        label.text = collectionViewModels[indexPath.row].labelText
        let size = label.sizeThatFits(CGSize(width: 200, height: 100))
        return CGSize(width: size.width + model.horizontalPadding*2, height: size.height + model.verticalPadding*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

