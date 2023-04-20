//
//  CustomProgressView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 7.04.23.
//

import UIKit

class CustomProgressView: UIView {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var progressView: ProgressBarView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        convenienceInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        convenienceInit()
    }
    
    func convenienceInit() {
        let view = Bundle.main.loadNibNamed("CustomProgressView", owner: self, options: nil)![0] as! UIView
        addSubview(view)
        
        setUpProgressView()
    }
    
    func updateProgressView(to progress: Float, color: UIColor) {
        progressView.progress = progress
        progressView.progressTintColor = color
    }

}

extension CustomProgressView {
    func setUpIconImageView(named text: String) {
        iconImageView.image = UIImage(named: text)
    }
    func setUpSecondaryLabel(text: String) {
        secondaryLabel.text = text
        secondaryLabel.font = .dmSansRegular(ofSize: 15)
        secondaryLabel.textColor = .brandMainColor
    }
    
    func setUpMainLabel(text: String) {
        mainLabel.text = text
        mainLabel.font = .dmSansRegular(ofSize: 11)
        mainLabel.textColor = .greyscale80
    }
    
    func setUpProgressView() {
        CGAffineTransformScale(progressView.transform, 1, 2)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        progressView.progress = 0.3
    }
}
