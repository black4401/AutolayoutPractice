//
//  CustomProgressCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 7.04.23.
//

import UIKit

class CustomProgressCell: UITableViewCell {
    
    
    @IBOutlet weak var movementProgressView: CustomMovementView!
    @IBOutlet weak var stressProgressView: CustomMovementView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
