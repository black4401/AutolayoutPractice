//
//  PainMonitorCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 5.04.23.
//

import UIKit

class PainMonitorCell: UITableViewCell {
    
    let style = PainMonitorCellStyle.evening

    @IBOutlet weak var customPainView: CustomPainView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customPainView.layer.cornerRadius = 6
        customPainView.clipsToBounds = true
        
        customPainView.configure(with: style)
    }
}
