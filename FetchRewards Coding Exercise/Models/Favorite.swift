//
//  Favorites.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/19/21.
//

import Foundation

struct Favorites: Codable {
    var id: [Int]
}

extension Favorites: Equatable {
    static func ==(lhs: Favorites, rhs: Favorites) -> Bool {
        return lhs.id == rhs.id
    }
}
