//
//  MUser.swift
//  IChat
//
//  Created by Andrey Novikov on 8/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

struct MUser: Decodable, Hashable {
    let userName: String
    let iconUrlString: String
    let id: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        guard  lhs.userName == rhs.userName, lhs.iconUrlString == rhs.iconUrlString, lhs.id == rhs.id else { return false }
        return true
    }
    
    func containts(withSearchText searchText: String?) -> Bool {
        guard let searchText = searchText else { return true }
        if searchText.isEmpty { return true }
        let lowerCasedSearchText = searchText.lowercased()
        return userName.contains(lowerCasedSearchText)
    }
}
