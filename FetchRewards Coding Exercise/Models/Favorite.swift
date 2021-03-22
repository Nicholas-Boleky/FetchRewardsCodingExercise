//
//  Favorite.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/19/21.
//

import Foundation

//I decided for persistence I didnt need to save an entire event object so I have a favorite object here that will be slightly lighter. This will be stored as an array and will be checked to display the favorite icon to the user. 

class Favorite: Codable {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}

extension Favorite: Equatable {
    static func ==(lhs: Favorite, rhs: Favorite) -> Bool {
        return lhs.id == rhs.id
    }
}
