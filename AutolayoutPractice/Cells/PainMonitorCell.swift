//
//  PainMonitorCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 5.04.23.
//

import UIKit

class PainMonitorCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var customPainView: CustomPainView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customPainView.layer.cornerRadius = 6
        customPainView.clipsToBounds = true
        
        customPainView.configure(with: .evening)
    }
}
