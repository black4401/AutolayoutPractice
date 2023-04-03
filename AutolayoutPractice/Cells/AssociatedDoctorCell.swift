//
//  CustomTableViewCell2.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AssociatedDoctorCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.image = UIImage(named: "doctor_icon")
        mainLabel.text = "Associated Doctor"
        label.text = "12345"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
