//
//  UITableView+Dequeue&Register.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 21.04.23.
//

import UIKit

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Wrong cell class")
        }
        return cell
    }
    
    func register(_ cellType: UITableViewCell.Type) {
        let nib = UINib(nibName: String(describing: cellType), bundle: nil)
        register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
