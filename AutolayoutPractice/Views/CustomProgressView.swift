//
//  CustomProgressView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 7.04.23.
//

import UIKit

class CustomProgressView: UIView, NibLoadableView {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var secondaryLabel: UILabel!
    @IBOutlet private weak var progressView: ProgressBarView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromXib()
        setUpProgressView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromXib()
        setUpProgressView()
    }
}

extension CustomProgressView {
    
    // MARK: - Public Methods
    
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
    
    func updateProgressView(to progress: Float, color: UIColor) {
        progressView.progress = progress
        progressView.progressTintColor = color
    }
    
    // MARK: - Private Methods
    
    private func setUpProgressView() {
        CGAffineTransformScale(progressView.transform, 1, 2)
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.layer.sublayers![1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        progressView.progress = 0.3
    }
}
