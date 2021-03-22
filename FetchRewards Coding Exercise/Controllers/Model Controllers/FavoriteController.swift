//
//  FavoriteController.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/19/21.
//

import Foundation

class FavoriteController {
    
    //source of truth
    var favorites: [Favorite] = []
    
    //singleton used to have once instance of our favorite array
    static let sharedInstance = FavoriteController()
    
    //MARK: Crud
    
    func addFavorite(from eventID: Int) {
        let event = Favorite(id: eventID)
        favorites.append(event)
        saveToPersistentStore()
        print("\(eventID), \(favorites)")
    }
    
    //Grabs event id when user clicks to unfavorite event. Uses that id to remove favorite from array.
    func removeFavoriteUsing(eventID: Int) {
        var pointer = 0
        
        while pointer < (favorites.count) {
            let scanner = favorites[pointer]
            if scanner.id == eventID {
                favorites.remove(at: pointer)
                saveToPersistentStore()
                return
            }
            pointer += 1
        }
    }
    
    
    
    //MARK: Persistance
    func createFileURLForPersistence() -> URL {
        //Grab users document directory
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //Create the new fileURL on user's phone
        let fileURL = urls[0].appendingPathComponent("FavoriteList.json")
        return fileURL
    }
    //Creates instance of JSON Encoder, encodes eventID to JSON, and saves to device.
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonFavorite = try jsonEncoder.encode(favorites)
            try jsonFavorite.write(to: createFileURLForPersistence())
        } catch let encodingError {
            print("There was an error saving!! \(encodingError.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        do{
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedFavorites = try jsonDecoder.decode([Favorite].self, from: jsonData)
            favorites = decodedFavorites
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
    
    
    
}//End of Class
