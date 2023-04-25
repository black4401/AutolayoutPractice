//
//  CustomTableViewCell6.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class MovementProgressCell: UITableViewCell {
    
    @IBOutlet weak var movementProgressView: CustomProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movementProgressView.layer.cornerRadius = 6
        movementProgressView.clipsToBounds = true
        
        movementProgressView.setUpIconImageView(named: "movement_icon")
        movementProgressView.setUpMainLabel(text: "MOVEMENT")
        movementProgressView.setUpSecondaryLabel(text: "Didn't move much")
    }
}
