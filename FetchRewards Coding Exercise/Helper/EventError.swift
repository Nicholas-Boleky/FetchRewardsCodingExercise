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
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server responded with no Data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}
