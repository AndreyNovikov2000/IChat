//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    // MARK: - UI
    
    private let addPhotoView = AddPhotoView()
    
    private let welcomeLabel = UILabel(title: "Setup profile", font: .avenir26)
    
    private let fullNameLabel = UILabel(title: "Full name")
    private let aboutMeLabel = UILabel(title: "About me")
    private let sexLabel = UILabel(title: "Sex")
    
    private let fullNameTextField = OneLineTextField(font: .avenir20)
    private let aboutMeTextField = OneLineTextField(font: .avenir20)
    
    private let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    private let goToChatButton = UIButton(title: "Go to chat",
                                          titleColor: .white,
                                          backgroundColor: .black,
                                          isShadow: false)
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
        addPhotoView.myDelegate = self
        view.backgroundColor = .white
    }
}


// MARK: - AddPhotoViewDelegate

extension SetupProfileViewController: AddPhotoViewDelegate {
    func addPhotoViewDidProfileButtonTapped(_ addPhotoView: AddPhotoView) {
        print(#function)
    }
}


// MARK: - Constraints

extension SetupProfileViewController {
    func setupConstraints() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 3)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 3)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 10)
        
        goToChatButton.translatesAutoresizingMaskIntoConstraints = false
        goToChatButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // profileStackView
        let arrangedSubviews = [fullNameStackView, aboutMeStackView, sexStackView, goToChatButton]
        let profileStackView = UIStackView(arrangedSubviews: arrangedSubviews, axis: .vertical, spacing: 35)
        
        view.addSubview(welcomeLabel)
        view.addSubview(addPhotoView)
        view.addSubview(profileStackView)
        
        // welcomeLabel
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // addPhotoView
        NSLayoutConstraint.activate([
            addPhotoView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            addPhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // profileStackView
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            profileStackView.topAnchor.constraint(equalTo: addPhotoView.bottomAnchor, constant: 70),
            profileStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            profileStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
