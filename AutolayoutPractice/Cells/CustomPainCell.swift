//
//  NewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class CustomPainCell: UITableViewCell {
    
    let styleMorning = PainMonitorCellStyle.morning
    let styleEvening = PainMonitorCellStyle.evening
    
    @IBOutlet weak var customView1: CustomPainView!
    @IBOutlet weak var customView2: CustomPainView!
    @IBOutlet weak var contentVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customView1.layer.cornerRadius = 6
        customView1.clipsToBounds = true
        
        customView2.layer.cornerRadius = 6
        customView2.clipsToBounds = true
        
        customView1.configure(with: styleMorning)
        
        customView2.configure(with: styleEvening)
    }
}
