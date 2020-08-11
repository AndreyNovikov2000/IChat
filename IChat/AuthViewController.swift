//
//  ViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - UI
    
    private let logoImage = UIImageView(image: UIImage(named: "Logo"), contentMode: .scaleAspectFit)
    
    private let googleLabel = UILabel(title: "Get started with")
    private let emailLabel = UILabel(title: "Or signup with")
    private let alreadyOnBoardLabel = UILabel(title: "Already onboard?")
    
    private let googleButton = UIButton(title: "Google",
                                        titleColor: .black,
                                        backgroundColor: .white,
                                        font: .avenir20,
                                        isShadow: true,
                                        cornerRadius: 4)
    
    private let emailButton = UIButton(title: "Email",
                                       titleColor: .white,
                                       backgroundColor: .backgroundBlack,
                                       isShadow: false)
    
    private let alreadyOnBoardButton = UIButton(title: "Login",
                                                titleColor: .black,
                                                backgroundColor: .white,
                                                font: .avenir20,
                                                isShadow: true,
                                                cornerRadius: 4)
    
    
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupConstraints()
        
        googleButton.comtomizedButton(withImage: UIImage(named: "comtomizedButton"))
        view.backgroundColor = .white
    }
}


// MARK: - Constraints

extension AuthViewController {
    private func setupConstraints() {
        let googleView = LoginFormView(label: googleLabel, button: googleButton)
        let emailView = LoginFormView(label: emailLabel, button: emailButton)
        let alreadyOnBoardView = LoginFormView(label: alreadyOnBoardLabel, button: alreadyOnBoardButton)
        let arrangedSubviews = [googleView, emailView, alreadyOnBoardView]
        
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews, axis: .vertical, spacing: 35)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(logoImage)
        view.addSubview(stackView)
        
        // logoImage
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // stackView
        
        stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -40).isActive = true
    }
}

// MARK: - Swift UI

import SwiftUI

struct ViewControllerProdider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}

