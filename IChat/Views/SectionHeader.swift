//
//  SectionHeader.swift
//  IChat
//
//  Created by Andrey Novikov on 8/13/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    // MARK: - UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        return label
    }()
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func configure(withSectionType sectionType: SectionType?) {
        guard let sectionType = sectionType else { return }
        titleLabel.text = sectionType.text
        titleLabel.font = sectionType.font
        titleLabel.textColor = sectionType.textColor
    }
    
    // MARK: - Private methods
    
    private func setupConstraints() {
        addSubview(titleLabel)
        
        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

