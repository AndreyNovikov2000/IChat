//
//  ConfiguratioonCell.swift
//  IChat
//
//  Created by Andrey Novikov on 8/13/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

protocol ConfiguringCell {
    static var reuseId: String { get }
    func configure<H: Hashable>(with value: H)
}
