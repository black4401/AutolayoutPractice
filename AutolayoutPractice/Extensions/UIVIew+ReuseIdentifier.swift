//
//  UIVIew+ReuseIdentifier.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 21.04.23.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
