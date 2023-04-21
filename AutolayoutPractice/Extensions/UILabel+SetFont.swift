//
//  TableViewCell+SetFont.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 4.04.23.
//

import UIKit

extension UILabel {
    func setFontToDMSans(with size: CGFloat) {
        self.font = .dmSansRegular(ofSize: size)
    }
    func setFontToSourceSansPro(with size: CGFloat) {
        self.font = .sourceSansPro(ofSize: size)
    }
}
