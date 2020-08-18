//
//  extention + UIImageView.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}


extension UIImageView {
    func setupColor(_ color: UIColor?) {
        guard let color = color else { return }
        let templayImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templayImage
        self.tintColor = color
    }
}
