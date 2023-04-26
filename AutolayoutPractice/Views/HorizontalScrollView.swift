//
//  HorizontalScrollableView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 25.04.23.
//

import UIKit

protocol HorizontalScrollViewDelegate: AnyObject {
    func didSelectCell(at indexPath: Int)
}

class HorizontalScrollView: UIView {
    
    var data: [TagModel] = []
    weak var delegate: HorizontalScrollViewDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadNib()
    }
    
    override func awakeFromNib() {
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        collectionView.register(TagCollectionViewCell.self)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout =  layout
    }
    
    
    private func loadNib() {
        let nib = UINib(nibName: "HorizontalScrollView", bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Failed to load HorizontalScrollView XIB")
        }
        
        addSubview(contentView)
    }
}

extension HorizontalScrollView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath) as! TagCollectionViewCell
        let model = data[indexPath.row]
        cell.configureCell(with: data[indexPath.row])
        cell.delegate = model.hasCloseButton ? self : nil
        if indexPath.row == 0 && data[indexPath.row].isSelectable {
            cell.backgroundColor = cell.selectedStateBackgroundColor
            cell.textLabel.textColor = cell.selectedStateTextColor
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let model = data[indexPath.row]
        let spaceForButton = model.hasCloseButton ? 10 : 0
        label.text = data[indexPath.row].labelText
        let size = label.sizeThatFits(CGSize(width: 200, height: 100))
        return CGSize(width: size.width + CGFloat(spaceForButton) + model.horizontalPadding*2, height: size.height + model.verticalPadding*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return data[indexPath.row].isSelectable
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCell(at: indexPath.row)
    }
}

extension HorizontalScrollView: TagCollectionViewCellDelegate {
    func didTapClose(on cell: TagCollectionViewCell) {
        if let indexPath = self.collectionView.indexPath(for: cell) {
            self.collectionView.performBatchUpdates {
                data.remove(at: indexPath.item)
                self.collectionView.deleteItems(at: [indexPath])
            }
        }
    }
}
