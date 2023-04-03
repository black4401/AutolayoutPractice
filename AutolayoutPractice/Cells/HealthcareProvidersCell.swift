//
//  TableViewCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class HealthcareProvidersCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
        iconView.image = UIImage(named: "doctor_bag_icon")
        label.text = "Healthcare Providers"
        setAccessory()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAccessory() {
        let image = UIImage(named: "healthcareProvidersAccessory")
        let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(image?.size.width)!, height:(image?.size.height)!))
        accessory.image = image

        accessoryView = accessory
    }
    
}
