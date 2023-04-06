//
//  NewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class NewCell: UITableViewCell {
    
    
    @IBOutlet weak var customView1: CustomView!
    @IBOutlet weak var customView2: CustomView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
