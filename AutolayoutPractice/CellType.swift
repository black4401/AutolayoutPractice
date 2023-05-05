//
//  CellType.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 4.05.23.
//

import Foundation
import UIKit

enum CellType: Int, CaseIterable {
    
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    
    var cellType: UITableViewCell.Type {
        switch self {
            case .one:
                return HealthcareProvidersCell.self
            case .two:
                return AssociatedDoctorCell.self
            case .three:
                return MorningEntryCell.self
            case .four:
                return MorningPainCell.self
            case .five:
                return MovementProgressCell.self
            case .six:
                return SavedArticleCell.self
            case .seven:
                return PainRateCell.self
            case .eight:
                return PainMonitorCell.self
            case .nine:
                return CustomPainCell.self
            case .ten:
                return CustomProgressCell.self
            case .eleven:
                return BodyPainCell.self
            case .twelve:
                return PainLocationCell.self
        }
    }
}
