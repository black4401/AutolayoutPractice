//
//  TableViewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class HealthcareProvidersCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        iconImageView.image = UIImage(named: "doctor_bag_icon")

        setUpAccessory()
        setUpLabel()
    }
}

// MARK: - Private Methods
private extension HealthcareProvidersCell {
    func setUpLabel() {
        label.font = .dmSansRegular(ofSize: 17)
        label.text = "Healthcare Providers"
        label.textColor = .brandMainColor
    }
    
    func setUpAccessory() {
       let image = UIImage(named: "healthcareProvidersAccessory")
       let accessory  = UIImageView(frame:CGRect(x:0, y:0, width: 7, height: 14))
       accessory.image = image

       accessoryView = accessory
   }
}
