//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

fileprivate let cellIdentifier = "tagCell"

class PainRateCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var editButton: ImageOnlyButton!
    
    var dataSource: [TagModel] = [TagModel(backgroundColor: .yellow10!, textLabel: "Back of left knee (2)", labelWidth: 146, hasCloseButton: false, isTextCentered: true), TagModel(backgroundColor: .yellow10!, textLabel: "Right knee cap (3)", labelWidth: 146, hasCloseButton: false, isTextCentered: false),TagModel(backgroundColor: .yellow10!, textLabel: "Back of left knee (2)", labelWidth: 146, hasCloseButton: false, isTextCentered: true), TagModel(backgroundColor: .yellow10!, textLabel: "Right knee cap (3)", labelWidth: 146, hasCloseButton: false, isTextCentered: false)]
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.dataSource = self
        collectionView.delegate = self
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        if dataSource[indexPath.item].hasCloseButton {
            cell.delegate = self
            cell.closeButton.isHidden = false
        }
        cell.backgroundColor = dataSource[indexPath.item].backgroundColor
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        cell.closeButton.isHidden = !dataSource[indexPath.item].hasCloseButton
        cell.textLabel.text = dataSource[indexPath.item].textLabel
        cell.textLabel.setFontToDMSans(with: 15)
        cell.textLabel.textAlignment = .center
        return cell
    }
    
    private func setUpCollectionView() {
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 146, height: 28)
        layout.minimumInteritemSpacing = 4

        collectionView.collectionViewLayout =  layout
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

extension PainRateCell: TagCollectionViewCellDelegate {
    func didTapClose(on cell: TagCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            dataSource.remove(at: indexPath.item)
            collectionView.deleteItems(at: [indexPath])
        }
    }
}

extension PainRateCell {
    struct TagModel {
        let backgroundColor: UIColor?
        let textLabel: String
        let labelWidth: CGFloat
        let hasCloseButton: Bool
        let isTextCentered: Bool
        
        init(backgroundColor: UIColor, textLabel: String, labelWidth: CGFloat, hasCloseButton: Bool, isTextCentered: Bool) {
            self.backgroundColor = backgroundColor
            self.textLabel = textLabel
            self.labelWidth = labelWidth
            self.hasCloseButton = hasCloseButton
            self.isTextCentered = isTextCentered
        }
    }
}
