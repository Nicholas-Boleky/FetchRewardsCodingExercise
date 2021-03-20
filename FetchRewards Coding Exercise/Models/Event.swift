//
//  Event.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/16/21.
//

import Foundation

struct TopLevelJSON: Decodable {
    let events: [Event]
}

struct Event: Decodable {
    let title: String
    let location: Venue
    let time: String
    let performers: [Performer]
    
    enum CodingKeys: String, CodingKey {
        case title = "short_title"
        case location = "venue"
        case time = "datetime_utc"
        case performers
    }
}

struct Venue: Decodable {
    let city: String
    let state: String
}
struct Performer: Decodable {
    let image: String
}
