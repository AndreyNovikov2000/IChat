//
//  MessagesTextField.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class MessagesTextField: UITextField {
    
    // MARK: - UI
    
    private let leftImageView = UIImageView()
    private let rightButton = UIButton(type: .system)
    
    // MARK: - Live cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTextField()
        setupLeftImageView()
        setupRightButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Set position for text field subviews
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 12
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 40, dy: 0)
    }
    
    // MARK: - Setup 
    
    private func setupTextField() {
        backgroundColor = .white
        placeholder = "White something here"
        font = .systemFont(ofSize: 14)
        borderStyle = .none
        clearButtonMode = .whileEditing
        layer.cornerRadius = 18
        layer.masksToBounds = true
    }
    
    private func setupLeftImageView() {
        let image = UIImage(systemName: "smiley")
        leftImageView.setupColor(.lightGray)
        leftImageView.image = image
        leftView = leftImageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        leftViewMode = .always
    }
    
    private func setupRightButton() {
        rightButton.setImage(UIImage(named: "Sent"), for: .normal)
        rightView = rightButton
        rightView?.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        rightViewMode = .always
    }
}
