//
//  CustomTableViewCell2.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class AssociatedDoctorCell: UITableViewCell {

    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var secondaryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.image = UIImage(named: "doctor_icon")

        setUpMainLabel()
        setUpSecondaryLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpMainLabel() {
        mainLabel.text = "Associated Doctor"
        mainLabel.textColor = .brandMainColor
        mainLabel.font = .dmSansMedium(ofSize: 16)
    }
    
    private func setUpSecondaryLabel() {
        secondaryLabel.text = "12345"
        secondaryLabel.textColor = .greyscale100
        secondaryLabel.font = .dmSansRegular(ofSize: 13)
    }
}
