//
//  ImageOnlyButton.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 19.04.23.
//

import UIKit

class ImageOnlyButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = bounds
        titleLabel?.isHidden = true
    }
}
