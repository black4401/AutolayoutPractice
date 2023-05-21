//
//  CustomTableViewCell4.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class MorningEntryCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var mainSwitch: UISwitch!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainSwitch.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        setUpMainLabel()
    }
    
    // MARK: - Private Methods
    
    private func setUpMainLabel() {
        mainLabel.text = "Morning entry"
        mainLabel.textColor = .greyscale120
        mainLabel.font = .dmSansRegular(ofSize: 17)
    }
}
