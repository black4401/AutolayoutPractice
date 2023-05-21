//
//  HeaderView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 4.05.23.
//

import UIKit

class HeaderView: UIView, NibLoadableView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var horizontalScrollView: CustomHorizontalScrollView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromXib()
    }
    
    // MARK: - Public Methods
    
    func configure(with models: [TagModel]) {
        horizontalScrollView.configure(with: models)
    }
}
