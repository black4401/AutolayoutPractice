//
//  CustomHorizontalScrollView.swift
//  AutolayoutPractice
//
//  Created by Alexander Angelov on 28.04.23.
//

import UIKit

protocol CustomHorizontalScrollViewDelegate: AnyObject {
    func didSelectView(with identifier: String)
}

class CustomHorizontalScrollView: UIView, NibLoadableView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var scrollView = UIScrollView(frame: .zero)
    private var tagViews: [TagView] {
        stackView.subviews as? [TagView] ?? []
    }
    
    weak var delegate: CustomHorizontalScrollViewDelegate?
    var isEmpty: Bool {
        tagViews.isEmpty
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private Methods
    private func setup() {
        addSubview(scrollView)
        scrollView.wrapInsideParent()
        scrollView.addSubview(stackView)
        stackView.wrapInsideParent()
    }
    
    // MARK: - Public Methods
    func configure(with models: [TagModel]) {
        models.forEach {
            let tagView = TagView(with: $0)
            tagView.delegate = self
            stackView.addArrangedSubview(tagView)
        }
    }
    
    func selectView(with identifier: String) {
        guard let tagView = tagViews.first(where: {$0.identifier == identifier}) else {
            return
        }
        scrollView.contentOffset = .zero
        tagView.viewEnterForeground()
    }
}

extension CustomHorizontalScrollView: TagViewDelegate {
    func didTapClose(for viewIdentifier: String) {
        guard let tagView = tagViews.first(where: {viewIdentifier == $0.identifier }) else {
            return
        }
        stackView.removeArrangedSubview(tagView)
        tagView.removeFromSuperview()
    }
    
    func didSelectView(with identifier: String) {
        tagViews.forEach { item in
            if identifier != item.identifier {
                item.deselect()
            }
        }
        delegate?.didSelectView(with: identifier)
    }
}

