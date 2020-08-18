//
//  extention + Label.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String, font: UIFont? = .avenir20) {
        self.init()
        
        self.text = title
        self.font = font
    }
}
