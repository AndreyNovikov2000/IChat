//
//  MChat.swift
//  IChat
//
//  Created by Andrey Novikov on 8/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

struct MChat: Hashable, Decodable {
    var friendName: String
    var friendImage: String
    var lastMessage: String
    
    var id: Int?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
    
    func containts(withSearchText searchText: String?) -> Bool {
        guard let searchText = searchText else { return true }
        if searchText.isEmpty { return true }
        let lowerCasedSearchText = searchText.lowercased()
        return friendName.contains(lowerCasedSearchText)
    }
}
