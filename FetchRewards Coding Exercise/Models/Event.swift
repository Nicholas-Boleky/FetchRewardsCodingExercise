//
//  Event.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/16/21.
//

import Foundation

//Straight forward model that lays out an event according to the API used.
struct TopLevelJSON: Decodable {
    let events: [Event]
}

struct Event: Decodable {
    let title: String
    let location: Venue
    let time: String
    let performers: [Performer]
    let id: Int
    //coding keys because I like to use swift style naming conventions but I still need to navigate the api correctly
    enum CodingKeys: String, CodingKey {
        case title = "short_title"
        case location = "venue"
        case time = "datetime_utc"
        case performers
        case id
    }
}

struct Venue: Decodable {
    let city: String
    let state: String
}
//image in api is a string of a URL so a function later in the app will take that string and convert it to a URL and fetch the image from that.
struct Performer: Decodable {
    let image: String
}
