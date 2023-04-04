//
//  TableViewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class HealthcareProvidersCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        iconView.image = UIImage(named: "doctor_bag_icon")

        setUpAccessory()
        setUpLabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
