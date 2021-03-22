//
//  EventError.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/18/21.
//

import Foundation

enum EventError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    // Enum containing a few different errors that will display on the alert controller found in error extension, this helps the user understand why the UI didnt function the way they expected if they receive an error
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach server test"
        case .thrownError(let error):
            return "\(error.localizedDescription) or because no events match the search term you entered."
        case .noData:
            return "The server responded with no Data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
