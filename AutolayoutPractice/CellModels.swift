//
//  CellModels.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 20.04.23.
//

import UIKit

class TagModel {
    
    let labelText: String
    let hasCloseButton: Bool
    let isSelectable: Bool
    let isTextCentered: Bool
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let font: UIFont
    let textColor: UIColor?
    let backgroundColor: UIColor?
    
    init(labelText: String, hasCloseButton: Bool, isSelectable: Bool, isTextCentered: Bool, horizontalPadding: CGFloat, verticalPadding: CGFloat, font: UIFont, textColor: UIColor?, backgroundColor: UIColor?) {
        self.labelText = labelText
        self.hasCloseButton = hasCloseButton
        self.isSelectable = isSelectable
        self.isTextCentered = isTextCentered
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
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
