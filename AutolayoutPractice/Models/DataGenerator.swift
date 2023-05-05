//
//  DataGenerator.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 27.04.23.
//

import Foundation
import UIKit

class DataGenerator {
    
    static func painLocationData() -> [TagModel] {
        let titles = ["Left big toe", "Right big toe" , "Left hand"]
        var data: [TagModel] = []
        for index in 0..<titles.count {
            data.append(TagModel(labelText: titles[index], hasCloseButton: true, isSelectable: false, isTextCentered: true, horizontalPadding: 4, verticalPadding: 4, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .greyscale05))
        }
        return data
    }
    
    static func painRateData() -> [TagModel] {
        let titles = ["Back of left knee (2)", "Back of right knee (2)" , "Back of foot (2)"]
        var data: [TagModel] = []
        for index in 0..<titles.count {
            data.append(TagModel(labelText: titles[index], hasCloseButton: false, isSelectable: false, isTextCentered: true, horizontalPadding: 3, verticalPadding: 3, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale140, backgroundColor: .yellow10))
        }
        return data
    }
    
    static func bodyPainData() -> [TagModel] {
        let titles = ["Overall", "Front of right head" , "Right face"]
        var data: [TagModel] = []
        for index in 0..<titles.count {
            data.append(TagModel(labelText: titles[index], hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite))
        }
        return data
    }
    
    static func filterData() -> [TagModel] {
        var data: [TagModel] = []
        for index in 0...11 {
            data.append(TagModel(labelText: "Cell \(index)", hasCloseButton: false, isSelectable: true, isTextCentered: true, horizontalPadding: 2, verticalPadding: 2, font: UIFont.dmSansRegular(ofSize: 15), textColor: .greyscale100, backgroundColor: .brandWhite))
            data[0].labelText = "All"
        }
        return data
    }
}
