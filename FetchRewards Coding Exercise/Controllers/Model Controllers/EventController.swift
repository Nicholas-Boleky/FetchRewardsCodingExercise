//
//  EventController.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/18/21.
//

import UIKit

class EventController {
    
    static let baseURL = URL(string: "https://api.seatgeek.com")
    static let apiVersion = "2"
    static let eventsQuery = "events"
    static let apiKey = "MjE2MDM2NTV8MTYxNTkxMzQxMC4xMzQ2OTg0"
    
    static func fetchEvent(for searchTerm: String, completion: @escaping (Result<[Event], EventError>) -> Void) {
        print("fetchevent func starting")
        guard var url = baseURL else { return completion(.failure(.invalidURL)) }
        
        url.appendPathComponent(apiVersion)
        url.appendPathComponent(eventsQuery)
        guard var components = URLComponents(url: url,
                                             resolvingAgainstBaseURL:  true) else { return completion(.failure(.invalidURL)) }
        let apiQuery = URLQueryItem(name: "client_id", value: apiKey)
        let searchQuery = URLQueryItem(name: "q", value: searchTerm)
        components.queryItems = [apiQuery, searchQuery]
        
        guard let finalURL = components.url else { return completion(.failure(.invalidURL)) }
        print("\(finalURL)")
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData)) }
            print("\(data)")
            do {
                let decoder = JSONDecoder()
                let topLevelJSON = try decoder.decode(TopLevelJSON.self, from: data)
                completion(.success(topLevelJSON.events))
                print("completion success")
                print(topLevelJSON.events)
            } catch {
                print("There was an error decoding the data: \(error.localizedDescription)")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
        
    }
    
    static func fetchImage(for event: Event, completion: @escaping (Result<UIImage, EventError>) -> Void) {
        guard let url = URL(string: event.performers.first!.image) else { return }
        print("does this work \(url)")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            
            guard let image = UIImage(data: data) else { return
                completion(.failure(.unableToDecode)) }
            completion(.success(image))
            
        }.resume()
    }
}
