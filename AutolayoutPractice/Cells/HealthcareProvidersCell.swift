//
//  TableViewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class HealthcareProvidersCell: UITableViewCell {
    
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        iconImageView.image = UIImage(named: "doctor_bag_icon")

        setUpAccessory()
        setUpLabel()
    }
}

private extension HealthcareProvidersCell {
    func setUpLabel() {
        label.setFontToDMSans(with: 17)
        label.text = "Healthcare Providers"
        label.textColor = .brandMainColor
    }
    
    func setUpAccessory() {
       let image = UIImage(named: "healthcareProvidersAccessory")
       let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
       accessory.image = image

       accessoryView = accessory
   }
}
