//
//  CustomTableViewCell4.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class MorningEntryCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainSwitch.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        setUpMainLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpMainLabel() {
        mainLabel.text = "Morning entry"
        mainLabel.textColor = .morningEntryColor
        mainLabel.setFontToDMSans(with: 17)
    }
}
