//
//  ViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

protocol AuthNavigationDelegate: class {
    func loginViewControllerDidDismiss(_ loginViewController: LoginViewController)
    func signUpViewControllerDidDismiss(_ signupViewController: SignUpViewController )
}

class AuthViewController: UIViewController {
    
    // MARK: - UI
    
    private let logoImage = UIImageView(image: UIImage(named: "Logo"), contentMode: .scaleAspectFit)
    
    private let googleLabel = UILabel(title: "Get started with")
    private let emailLabel = UILabel(title: "Or signup with")
    private let alreadyOnBoardLabel = UILabel(title: "Already onboard?")
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, font: .avenir20, isShadow: true, cornerRadius: 4)
        button.comtomizedButton(withImage: UIImage(named: "comtomizedButton"))
        button.addTarget(self, action: #selector(handleGoogleButtonTapped), for: .touchUpInside)
        return button

    }()
    
    private lazy var emailButton: UIButton = {
        let button = UIButton(title: "Email", titleColor: .white, backgroundColor: .backgroundBlack, isShadow: false)
        button.addTarget(self, action: #selector(handleEmailButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyOnBoardButton: UIButton = {
        let button = UIButton(title: "Login", titleColor: .black, backgroundColor: .white, font: .avenir20, isShadow: true, cornerRadius: 4)
        button.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let signUpViewController = SignUpViewController()
    private let loginViewController = LoginViewController()
    
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupConstraints()
    
        view.backgroundColor = .white
    }
    
    // MARK: - Selector methods

    @objc private func handleGoogleButtonTapped() {
        print(#function)
    }
    
    @objc private func handleEmailButtonTapped() {
        signUpViewController.myDelegate = self
        present(signUpViewController, animated: true, completion: nil)
    }
    
    @objc private func handleLoginButtonTapped() {
        loginViewController.myDelegate = self
       present(loginViewController, animated: true, completion: nil)
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


// MARK: - LoginViewControllerDelegate

extension AuthViewController: AuthNavigationDelegate {
    func loginViewControllerDidDismiss(_ loginViewController: LoginViewController) {
        present(signUpViewController, animated: true, completion: nil)
    }
    
    func signUpViewControllerDidDismiss(_ signupViewController: SignUpViewController) {
        present(loginViewController, animated: true, completion: nil)
    }
}
