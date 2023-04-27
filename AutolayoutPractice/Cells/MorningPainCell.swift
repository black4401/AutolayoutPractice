//
//  CustomTableViewCell5.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class MorningPainCell: UITableViewCell {
    
    @IBOutlet private weak var customPainView: CustomPainView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customPainView.layer.cornerRadius = 6
        customPainView.clipsToBounds = true
        
        customPainView.configure(with: .morning)
    }
}

