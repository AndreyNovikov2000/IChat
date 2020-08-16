//
//  UserCell.swift
//  IChat
//
//  Created by Andrey Novikov on 8/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, ConfiguringCell {

    
    
    static var reuseId: String = "UserCell"
    
    // MARK: - UI
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .avenir20
        label.text = "Martin lac"
        return label
    }()
    
    // MARK: - Public properties
    
    var chat: MChat?
    
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.layer.cornerRadius = 5
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.shadowGray.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    // MARK: - Public methods
    
    func configure<H>(with value: H) where H: Hashable {
        guard let user = value as? MUser else { return }
//        profileImageView.image =
        userNameLabel.text = user.userName
    }
    
    
    // MARK: - Private methods
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        addSubview(profileImageView)
        addSubview(userNameLabel)
        
        // profileImageUrl
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: widthAnchor),
            profileImageView.heightAnchor.constraint(equalTo: widthAnchor),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
        
        // userNameLabel
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -8)
        ])
    }
}
