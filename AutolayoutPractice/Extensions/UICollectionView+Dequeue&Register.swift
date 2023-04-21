//
//  UICollectionView+Dequeue&Register.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 21.04.23.
//

import UIKit

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            
            fatalError("Wrong cell class")
        }
        return cell
    }
    
    func register(_ cellType: UICollectionViewCell.Type) {
        
        let cellNib = UINib(nibName: String(describing: cellType), bundle: Bundle.main)
        self.register(cellNib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
}
