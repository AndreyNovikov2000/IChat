//
//  ChatRequestViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class ChatRequestViewController: UIViewController {

    // MARK: - UI
    
    private let containerView = UIView()
    private let profileImageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(title: "Piter ban", font: .systemFont(ofSize: 20, weight: .medium))
    private let aboutMeLabel = UILabel(title: "You have the opportunity to start new chat", font: .systemFont(ofSize: 16))
    private let acceptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, font: .loaSangamMN20, isShadow: false, cornerRadius: 10)
    private let denyButton = UIButton(title: "DENY", titleColor: .backgroundRed, backgroundColor: .white, font: .loaSangamMN20, isShadow: false, cornerRadius: 10)
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        constomizeElements()
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        acceptButton.applyGradient(cornerRadius: 10)
    }
    
    
    // MARK: - Private methods
    
    private func constomizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = UIColor.backgroundRed.cgColor
    }
}


// MARK: - Constraint

extension ChatRequestViewController {
    private func setupConstraints() {
        view.addSubview(profileImageView)
        view.addSubview(containerView)
       
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 10)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillProportionally
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(buttonsStackView)
        
        // containerView
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        // imageView
        NSLayoutConstraint.activate([
            profileImageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        // aboutMeLabel
        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        // buttonsStackView
        NSLayoutConstraint.activate([
             buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 20),
             buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
             buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
             buttonsStackView.heightAnchor.constraint(equalToConstant: 55)
         ])
    }
}
