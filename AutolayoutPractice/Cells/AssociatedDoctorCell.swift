//
//  CustomTableViewCell2.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AssociatedDoctorCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.image = UIImage(named: "doctor_icon")

        setUpMainLabel()
        setUpSecondaryLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpMainLabel() {
        mainLabel.text = "Associated Doctor"
        mainLabel.textColor = .brandMainColor
        mainLabel.setFontToDMSans(with: 16)
    }
    
    private func setUpSecondaryLabel() {
        secondaryLabel.text = "12345"
        secondaryLabel.textColor = .greyscale100
        secondaryLabel.setFontToDMSans(with: 13)
    }
}
