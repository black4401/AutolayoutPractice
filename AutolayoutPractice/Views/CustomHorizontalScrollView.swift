//
//  HorizontalScrollView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 10.04.23.
//

import UIKit

class CustomHorizontalScrollView: UIScrollView {
    
    private let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 145, height: 28))

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func addSubview(_ subview: CustomConfigurableView) {
        contentView.addSubview(subview)
        //layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentWidth = self.contentSize.width
        let frameWidth = self.frame.width
        let shouldEnableScrolling = contentWidth > frameWidth
        self.isScrollEnabled = shouldEnableScrolling
    }
}
