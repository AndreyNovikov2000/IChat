//
//  LoginViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI
    
    private let welcomeLabel = UILabel(title: "Welcome", font: .avenir26)
    
    private let loginWithLabel = UILabel(title: "Login with")
    private let orLabel = UILabel(title: "or")
    private let emailLabel = UILabel(title: "Email")
    private let passwordLabel = UILabel(title: "Password")
    private let needAnAccountLabel = UILabel(title: "Need an account?")
    
    private let googleButton = UIButton(title: "Google",
                                        titleColor: .black,
                                        backgroundColor: .white,
                                        isShadow: true)
    
    private let loginButton = UIButton(title: "Login",
                                       titleColor: .white,
                                       backgroundColor: .black,
                                       isShadow: false)
    
    private let emailTextField = OneLineTextField(font: .avenir20)
    private let passwordTextField = OneLineTextField(font: .avenir20)
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.titleRed, for: .normal)
        button.titleLabel?.font = .avenir20
        return button
    }()
    
    
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
        googleButton.comtomizedButton(withImage: UIImage(named: "comtomizedButton"))
        view.backgroundColor = .white
    }
}


// MARK: - Constraints

extension LoginViewController {
    private func setupConstraints() {
        let loginWithView = LoginFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 3)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 3)
        
        // loginStackView
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let arrangedSubviews = [loginWithView, orLabel, emailStackView, passwordStackView, loginButton]
        let loginStackView = UIStackView(arrangedSubviews: arrangedSubviews, axis: .vertical, spacing: 35)
        
        // bottomStackView
        let bottomStackView = UIStackView(arrangedSubviews: [needAnAccountLabel, signInButton], axis: .horizontal, spacing: 10)
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(loginStackView)
        view.addSubview(bottomStackView)
        
        // welcome label constraints
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 90),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // login stack view constraints
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 70),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        // bottom stack view
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomStackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -5).isActive = true
        bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
    }
}



// MARK: - SwiftUI

import SwiftUI

struct LoginViewProdider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
}
