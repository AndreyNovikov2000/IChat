//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Andrey Novikov on 8/13/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit


class ActiveChat: UICollectionViewCell, ConfiguringCell {

    static let reuseId: String = "ActiveChatCell"
    
    // MARK: - UI
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .loaSangamMN20
        label.text = "Whats going on?"
        return label
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .loaSangamMN18
        label.text = "How are you?"
        return label
    }()
    
    private let gradientView:  GradientView = {
        let startColor = UIColor(red: 0.9475557208, green: 0.3711209297, blue: 0.3631222546, alpha: 1)
        let endColor = UIColor(red: 0.993031323, green: 0.8765446544, blue: 0.3940051794, alpha: 1)
        let gradientView = GradientView(fromPoint: .top, toPoint: .bottom, startColor: startColor, endColor: endColor)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupConstraints()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
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
        addSubview(gradientView)
        addSubview(userNameLabel)
        addSubview(lastMessageLabel)
      
        
        // profileImageView
        NSLayoutConstraint.activate([
            profileImageView.heightAnchor.constraint(equalTo: heightAnchor),
            profileImageView.widthAnchor.constraint(equalTo: heightAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        // gradientView
         NSLayoutConstraint.activate([
             gradientView.heightAnchor.constraint(equalTo: heightAnchor),
             gradientView.widthAnchor.constraint(equalToConstant: 8),
             gradientView.topAnchor.constraint(equalTo: topAnchor),
             gradientView.trailingAnchor.constraint(equalTo: trailingAnchor)
         ])
        
        // userNameLabel
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16)
        ])
        
        // lastMessageLabel
        NSLayoutConstraint.activate([
            lastMessageLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 6),
            lastMessageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            lastMessageLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: -16)
        ])
    }
}
