//
//  CustomTableViewCell4.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 29.03.23.
//

import UIKit

class CustomTableViewCell4: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
