//
//  CustomTableViewCell6.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 30.03.23.
//

import UIKit

class MovementProgressCell: UITableViewCell {
    
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movementLabel.text = "MOVEMENT"
        movementLabel.font = .dmSansRegular(ofSize: 11)
        movementLabel.textColor = .grayscale80
        
        secondaryLabel.text = "Didn't move much"
        secondaryLabel.font = .dmSansRegular(ofSize: 15)
        secondaryLabel.textColor = .brandMainColor
        
        CGAffineTransformScale(progressView.transform, 1, 2)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        iconView.image = UIImage(named: "movement_icon")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
