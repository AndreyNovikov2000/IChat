//
//  SignUpViewController.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - External proprties
    
    weak var myDelegate: AuthNavigationDelegate?
    
    // MARK: - UI
    
    private let welcomeLabel = UILabel(title: "Welcome back!", font: .avenir26)
    
    private let emailLabel = UILabel(title: "Email")
    private let passwordLabel = UILabel(title: "Password")
    private let confirmPasswordLabel = UILabel(title: "Confirm password")
    private let alreeadyOnBoardLabel = UILabel(title: "Already on board?")
    
    private let emailTextField = OneLineTextField(font: .avenir20)
    private let passwordTextField = OneLineTextField(font: .avenir20)
    private let confirmPasswordTextField = OneLineTextField(font: .avenir20)
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(title: "Sign up", titleColor: .white, backgroundColor: .backgroundBlack, isShadow: false)
        button.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.titleRed, for: .normal)
        button.titleLabel?.font = .avenir20
        button.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Live cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        
        view.backgroundColor = .white
    }
    
    // MARK: - Selector methods
    
    @objc private func handleSignUpButton() {
        AuthService.shared.createUser(withEmail: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(withTitle: "Success", message: "You are registred") {
                    self.present(SetupProfileViewController(), animated: true, completion: nil)
                }
            case .failure(let error):
                self.showAlert(withTitle: "Error", message: error.localizedDescription)
            }
        }
    }
    
    @objc private func handleLoginButtonTapped() {
        dismiss(animated: true) {
            self.myDelegate?.signUpViewControllerDidDismiss(self)
        }
    }
}


// MARK: - Constraints

extension SignUpViewController {
    private func setupConstraints() {
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 3)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 3)
        let confirmStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 3)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // signUp stack view
        let signUpArrangedSubviews = [emailStackView, passwordStackView, confirmStackView, signUpButton]
        let signUpStackView = UIStackView(arrangedSubviews: signUpArrangedSubviews, axis: .vertical, spacing: 35)
        
        // bottom stack view
        let bottomStackView = UIStackView(arrangedSubviews: [alreeadyOnBoardLabel, loginButton], axis: .horizontal, spacing: 10)
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(signUpStackView)
        view.addSubview(bottomStackView)
        
        // welcomeLabel
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 90).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // signUpStackView
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 70),
            signUpStackView.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 40),
            signUpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        // bottomStackView
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
}
