//
//  AboutMeViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI
    
    private let containerView = UIView()
    private let profileImageView = UIImageView(image: #imageLiteral(resourceName: "human10"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(title: "Piter ban", font: .systemFont(ofSize: 20, weight: .medium))
    private let aboutMeLabel = UILabel(title: "You have the opportunity to chat with the best man in the world", font: .systemFont(ofSize: 16))
    private let myTextField = MessagesTextField()
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constomizeElements()
        setupConstraints()
        
        view.backgroundColor = .black
    }
    
    // MARK: - Selector methods
    
    @objc private func handleTextFieldSentButtonTapped() {
       
    }
    
    
    // MARK: - Private methods
    
    private func constomizeElements() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        aboutMeLabel.numberOfLines = 0
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 30
        
        if let button = myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(handleTextFieldSentButtonTapped), for: .touchUpInside)
        }
    }
}

// MARK: - Constraints

extension ProfileViewController {
    private func setupConstraints() {
        view.addSubview(profileImageView)
        view.addSubview(containerView)
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(myTextField)
        
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
        
        NSLayoutConstraint.activate([
            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 10),
            myTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            myTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25),
            myTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
