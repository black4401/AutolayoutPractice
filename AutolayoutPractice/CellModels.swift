//
//  CellModels.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 20.04.23.
//

import UIKit

class PainLocationTagModel {
    let textForLabel: String
    let hasCloseButton: Bool
    
    init(textLabel: String, hasCloseButton: Bool) {
        self.textForLabel = textLabel
        self.hasCloseButton = hasCloseButton
    }
}

class PainRateTagModel {
    let backgroundColor: UIColor?
    let textLabel: String
    let hasCloseButton: Bool
    let isTextCentered: Bool
    
    init(backgroundColor: UIColor, textLabel: String, hasCloseButton: Bool, isTextCentered: Bool) {
        self.backgroundColor = backgroundColor
        self.textLabel = textLabel
        self.hasCloseButton = hasCloseButton
        self.isTextCentered = isTextCentered
    }
}

class BodyPainCellTagModel {
    let textLabel: String
    
    init(textLabel: String) {
        self.textLabel = textLabel
    }
}
