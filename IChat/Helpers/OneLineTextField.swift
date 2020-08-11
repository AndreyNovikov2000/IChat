//
//  OneLineTextField.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class OneLineTextField: UITextField {
    
    
    
    // MARK: - Live cycle
    
    convenience init(font: UIFont? = .avenir20) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // buttomView
        let buttomView = UIView()
        buttomView.translatesAutoresizingMaskIntoConstraints = false
        buttomView.backgroundColor = .backgroundGray
        
        addSubview(buttomView)
        
        NSLayoutConstraint.activate([
            buttomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttomView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
