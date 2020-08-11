//
//  extention + UIButton.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String?, titleColor: UIColor, backgroundColor: UIColor, font: UIFont? = .avenir20, isShadow: Bool, cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.blue.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func comtomizedButton(withImage image: UIImage?) {
        let logoImageView = UIImageView(image: image, contentMode: .scaleAspectFit)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logoImageView)
        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
