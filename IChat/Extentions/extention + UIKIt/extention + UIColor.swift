//
//  extention + UIColor.swift
//  IChat
//
//  Created by Andrey Novikov on 8/11/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIColor {
    static let titleRed = UIColor(red: 208, green: 2, blue: 27)
    static let backgroundBlack = UIColor(red: 51, green: 51, blue: 51)
    static let backgroundGray = UIColor(red: 230, green: 230, blue: 230)
    static let shadowGray = UIColor(red: 189, green: 189, blue: 189)
    static let backgroundRed = UIColor(red: 213, green: 51, blue: 51)
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
