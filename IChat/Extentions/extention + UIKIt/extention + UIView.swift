//
//  extention + UIView.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(fromPoint: .topTrailing, toPoint: .bottomLeading, startColor: #colorLiteral(red: 1, green: 0.2415002286, blue: 0.6340380311, alpha: 1), endColor: #colorLiteral(red: 0.537254902, green: 0.968627451, blue: 0.9960784314, alpha: 1))
        
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
