//
//  DateFormatter.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/22/21.
//

import Foundation

class EventDateFormatter {
//    func EventDateFormatter(date: String) {
//        let eventDateFormatter = DateFormatter()
//        eventDateFormatter.local = Locale(identifier: "en_US_POSIX")
//    }
    func formatLongDate(apiDate: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "EEEE, d MMM yyyy h:mm a"
        guard let unwrappedDate = date else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }
        
    func formatShortDate(apiDate: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "EEEE, d MMM"
        guard let unwrappedDate = date else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }
    
    func formatTime(apiDate: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: apiDate)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        guard let unwrappedDate = date else { return "Date Unknown" }
        return timeFormatter.string(from: unwrappedDate)
    }

    
    
  
}
