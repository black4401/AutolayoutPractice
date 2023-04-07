//
//  CustomProgressCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 7.04.23.
//

import UIKit

class CustomProgressCell: UITableViewCell {
    
    
    @IBOutlet weak var movementProgressView: CustomProgressView!
    @IBOutlet weak var stressProgressView: CustomProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movementProgressView.setUpIconImageView(named: "movement_icon")
        movementProgressView.setUpMainLabel(text: "MOVEMENT")
        movementProgressView.setUpSecondaryLabel(text: "Didn't move much")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
