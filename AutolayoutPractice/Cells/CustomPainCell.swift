//
//  NewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class CustomPainCell: UITableViewCell {
    
    
    @IBOutlet weak var customView1: CustomPainView!
    @IBOutlet weak var customView2: CustomPainView!
    @IBOutlet weak var contentVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customView1.setUpAvgLabel(value: "7.4")
        customView1.setSecondaryLabelText(text: "8% lower than last period")
        customView1.setUpPainLabel(text: "MORNING PAIN")
        customView1.setUpIconView(iconName: "sun_icon")
        
        customView2.setUpAvgLabel(value: "6.4")
        customView2.setSecondaryLabelText(text: "8% higher than last period")
        customView2.setUpPainLabel(text: "EVENING PAIN")
        customView2.setUpIconView(iconName: "moon_icon")
    }
}
