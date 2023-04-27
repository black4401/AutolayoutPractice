//
//  NibLoadableView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 27.04.23.
//

import UIKit

protocol NibLoadableView {}

extension NibLoadableView where Self: UIView {
    func loadFromXib() {
        let nib = UINib(nibName: Self.reuseIdentifier, bundle: nil)
        guard let view = nib.instantiate(withOwner: self)[0] as? UIView else {
            return
        }
        addSubview(view)
        view.wrapInsideParent()
    }
}
