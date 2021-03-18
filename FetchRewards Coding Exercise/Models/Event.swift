//
//  Event.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/16/21.
//

import Foundation

struct TopLevelJSON: Codable {
    let events: [Event]
}

struct Event: Codable {
    let title: String
    let location: Venue
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case title = "short_title"
        case location
        case time = "datetime_local"
    }
}

struct Venue: Codable {
    let city: String
    let state: String
}
