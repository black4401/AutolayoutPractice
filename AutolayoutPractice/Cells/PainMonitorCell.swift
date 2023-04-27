//
//  PainMonitorCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 5.04.23.
//

import UIKit

class PainMonitorCell: UITableViewCell {
    
    @IBOutlet private weak var customPainView: CustomPainView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customPainView.layer.cornerRadius = 6
        customPainView.clipsToBounds = true
        
        customPainView.configure(with: .evening)
    }
}
