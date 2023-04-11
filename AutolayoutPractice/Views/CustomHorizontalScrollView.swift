//
//  HorizontalScrollView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 10.04.23.
//

import UIKit

class CustomHorizontalScrollView: UIScrollView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }

    func addSubview(_ subview: CustomConfigurableView) {
        collectionView.addSubview(subview)
        layoutSubviews()
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: collectionView.collectionViewLayout.collectionViewContentSize.height)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let contentWidth = self.contentSize.width
        let frameWidth = self.frame.width
        let shouldEnableScrolling = contentWidth > frameWidth
        self.isScrollEnabled = shouldEnableScrolling
    }
}
