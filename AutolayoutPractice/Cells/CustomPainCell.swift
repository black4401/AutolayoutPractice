//
//  NewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 6.04.23.
//

import UIKit

class CustomPainCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var customView1: CustomPainView!
    @IBOutlet private weak var customView2: CustomPainView!
    @IBOutlet private weak var contentVIew: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customView1.layer.cornerRadius = 6
        customView1.clipsToBounds = true
        
        customView2.layer.cornerRadius = 6
        customView2.clipsToBounds = true
        
        customView1.configure(with: .morning)
        
        customView2.configure(with: .evening)
    }
}
