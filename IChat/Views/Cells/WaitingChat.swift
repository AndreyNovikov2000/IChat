//
//  WaitingChat.swift
//  IChat
//
//  Created by Andrey Novikov on 8/13/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WaitingChat: UICollectionViewCell, ConfiguringCell {

    static var reuseId: String = "WaitingChat"
    
    // MARK: - UI
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public methods
    
    func configure<MChat>(with value: MChat)  {
        
    }
 
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        addSubview(profileImageView)
        
        // profileImageView
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
