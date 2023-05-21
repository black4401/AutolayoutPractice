//
//  CustomProgressCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 7.04.23.
//

import UIKit

class CustomProgressCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var movementProgressView: CustomProgressView!
    @IBOutlet private weak var stressProgressView: CustomProgressView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movementProgressView.layer.cornerRadius = 6
        movementProgressView.clipsToBounds = true
        
        stressProgressView.layer.cornerRadius = 6
        stressProgressView.clipsToBounds = true
        
        movementProgressView.setUpIconImageView(named: "movement_icon")
        movementProgressView.setUpMainLabel(text: "MOVEMENT")
        movementProgressView.setUpSecondaryLabel(text: "Didn't move much")
        movementProgressView.updateProgressView(to: 0.5, color: .systemInfoBlue!)
        
        stressProgressView.setUpIconImageView(named: "stress")
        stressProgressView.setUpMainLabel(text: "STRESS MANAGEMENT")
        stressProgressView.setUpSecondaryLabel(text: "Feeling some \nstress")
        stressProgressView.updateProgressView(to: 0.5, color: .redCritical100!)
    }
}
