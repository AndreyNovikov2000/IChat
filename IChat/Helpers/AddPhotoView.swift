//
//  AddPhotoView.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

protocol AddPhotoViewDelegate: class {
    func addPhotoViewDidProfileButtonTapped(_ addPhotoView: AddPhotoView)
}

class AddPhotoView: UIView {
    
    // MARK: - External properties
    
    weak var myDelegate: AddPhotoViewDelegate?
    
    // MARK: - UI
    
    private let circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private lazy var addProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "plus")
        button.setImage(image, for: .normal)
        button.tintColor = .backgroundBlack
        button.addTarget(self, action: #selector(handleAddProfileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circleImageView.layer.cornerRadius = circleImageView.frame.height / 2
    }
    
    // MARK: - Selector methods
    
    @objc private func handleAddProfileButtonTapped() {
        myDelegate?.addPhotoViewDidProfileButtonTapped(self)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        addSubview(circleImageView)
        addSubview(addProfileButton)
        
        // circleImageView
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: topAnchor),
            circleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // addProfileButton
        NSLayoutConstraint.activate([
            addProfileButton.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor),
            addProfileButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 17),
            addProfileButton.heightAnchor.constraint(equalToConstant: 30),
            addProfileButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: addProfileButton.trailingAnchor).isActive = true
    }
}


