//
//  ActivityCell.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 5.04.23.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var movementLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var iconView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpMovementLabel(text: "MOVEMENT")
        setUpIconView(with: "movement_icon")
        setUpSecondaryLabel(text: "Didn't move much")
        setUpProgressView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ActivityCell {
    
    func setUpIconView(with name: String) {
        iconView.image = UIImage(named: name)
    }
    
    func setUpSecondaryLabel(text: String) {
        secondaryLabel.text = text
        secondaryLabel.font = .dmSansRegular(ofSize: 15)
        secondaryLabel.textColor = .brandMainColor
    }
    
    func setUpMovementLabel(text: String) {
        movementLabel.text = text
        movementLabel.font = .dmSansRegular(ofSize: 11)
        movementLabel.textColor = .greyscale80
    }
    
    func setUpProgressView() {
        CGAffineTransformScale(progressView.transform, 1, 2)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
    }
    
}
