//
//  CellModels.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 20.04.23.
//

import UIKit

class TagModel {
    // MARK: - Properties
    
    var labelText: String
    let hasCloseButton: Bool
    let isSelectable: Bool
    let isTextCentered: Bool
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let font: UIFont
    let textColor: UIColor?
    let backgroundColor: UIColor?
    
    // MARK: - Initializers
    
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

extension TagModel: Equatable {
    static func == (lhs: TagModel, rhs: TagModel) -> Bool {
        return lhs.labelText == rhs.labelText
    }
}
