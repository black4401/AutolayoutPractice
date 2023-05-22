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

class HorizontalScrollView: UIView, NibLoadableView {
    
    // MARK: - Properties
    
    var data: [TagModel] = []
    weak var delegate: HorizontalScrollViewDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromXib()
    }
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        setUpCollectionView()
    }
    
    // MARK: - Private Methods
    
    private func setUpCollectionView() {
        collectionView.register(TagCollectionViewCell.self)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 4
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout =  layout
    }
}

// MARK: - CollectionView Methods
extension HorizontalScrollView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(withReuseIdentifier: CellIdentifiers.tagCellIdentifier, for: indexPath)
        
        guard let cell = cell as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let model = data[indexPath.row]
        cell.configureCell(with: data[indexPath.row])
        cell.delegate = model.hasCloseButton ? self : nil
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        let model = data[indexPath.row]
        let spaceForButton = model.hasCloseButton ? 20 : 0
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
// MARK: - TagCollectionViewCellDelegate
extension HorizontalScrollView: TagCollectionViewCellDelegate {
    func didTapClose(on cell: TagCollectionViewCell) {
        guard let indexPath = self.collectionView.indexPath(for: cell) else {
            return
        }
        self.collectionView.performBatchUpdates {
//implement the date.remove with delegate patern
            data.remove(at: indexPath.item)
            self.collectionView.deleteItems(at: [indexPath])
        }
        
    }
}
