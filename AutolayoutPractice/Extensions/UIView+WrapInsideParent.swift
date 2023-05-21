//
//  UIView+WrapInsideParent.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 27.04.23.
//

import UIKit

extension UIView {
    func wrapInsideParent() {
        guard let parentView = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            topAnchor.constraint(equalTo: parentView.topAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
}
