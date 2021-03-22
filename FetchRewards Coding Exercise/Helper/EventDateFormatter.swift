//
//  EventDateFormatter.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/22/21.
//

import Foundation

class EventDateFormatter {

    func formatLongDate(apiDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let dateFromString = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "EEEE, d MMM yyyy h:mm a"
        guard let unwrappedDate = dateFromString else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }
        
    func formatShortDate(apiDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFromString = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "EEEE, d MMM yyyy"
        guard let unwrappedDate = dateFromString else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }
    
    func formatTime(apiDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFromString = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        guard let unwrappedDate = dateFromString else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }

    
    
  
}
