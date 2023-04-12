//
//  CustomTableViewCell8.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class PainRateCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.row {
////            case 0:
////                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionReusableView
////                return cell
//            default:
//                return UICollectionViewCell()
//        }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.scrollDirection = .horizontal
        
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomCollectionReusableView", for: indexPath) as! CustomCollectionReusableView
                view.backgroundView.backgroundColor = .yellow10
                view.closeButton.isHidden = true
                view.textLabel.text = "TextTexttext (21)"
                view.textLabel.setFontToDMSans(with: 15)
                collectionView.addSubview(view)
                return view
            default:
                let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomCollectionReusableView", for: indexPath) as! CustomCollectionReusableView
                view.backgroundView.backgroundColor = .yellow10
                view.closeButton.isHidden = true
                view.textLabel.text = "TextTexttext (21)"
                view.textLabel.setFontToDMSans(with: 15)
                collectionView.addSubview(view)
                return view
        }
        
    }

    
    
    private func setUpCollectionView() {
        collectionView.register(CustomCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CustomCollectionReusableView")
        
        let layout = HorizontalCollectionViewFlowLayout()
        layout.numberOfViews = 3
        collectionView.collectionViewLayout = layout
        let view = CustomCollectionReusableView()
//        view.backgroundView.backgroundColor = .yellow10
//        view.closeButton.isHidden = true
//        view.textLabel.text = "TextTexttext (21)"
//        view.textLabel.setFontToDMSans(with: 15)
        collectionView.addSubview(view)
    }

    
    
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
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
    //collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpPainLabel()
        setUpMorningLabel()
        setUpSeverityLabel()
        //setUpHorizontalScrollView()
        //setUpPainLocationLabel()
        
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
    
//    func setUpPainLocationLabel() {
//        painLocationLabel.text = "Back of left knee (8)"
//        painLocationLabel.setFontToDMSans(with: 15)
//        painLocationLabel.textColor = .greyscale140
//
//        painLocationLabel.layer.cornerRadius = 6
//        painLocationLabel.clipsToBounds = true
//    }
    
//    func setUpHorizontalScrollView() {
//        let view = CustomConfigurableView(frame: CGRect(x: 0, y: 0, width: 145, height: 28))
//        view.setUpForPainRateCell(with: "Back of left knee (2)")
//
//        horizontalScrollView.addSubview(view)
//    }
    
    
}



class HorizontalCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var numberOfViews: CGFloat = 3 {
        didSet {
            invalidateLayout()
        }
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        
        scrollDirection = .horizontal
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        minimumInteritemSpacing = 10
        
        //let viewWidth = (collectionView.bounds.width - minimumInteritemSpacing * (numberOfViews - 1)) / numberOfViews
        //let viewHeight = collectionView.bounds.height
        
        // Set the size of each view
        itemSize = CGSize(width: 145, height: 28)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        guard let collectionView = collectionView else { return attributes }
        
        // Loop through the attributes and adjust their positions based on their index path
        for attribute in attributes ?? [] {
            if attribute.representedElementCategory == .cell {
                let indexPath = attribute.indexPath
                let xPosition = CGFloat(indexPath.item) * (itemSize.width + minimumInteritemSpacing)
                attribute.frame.origin.x = xPosition
                attribute.frame.origin.y = 0
            }
        }
        
        return attributes
    }
}

