//
//  EventDetailViewController.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/19/21.
//

import UIKit

class EventDetailViewController: UIViewController {
    //This var is used to decide if it should display heart icon
    var isFavorite: Bool = false
    
    var event: Event? {
        didSet {
            DispatchQueue.main.async {
                self.loadViewIfNeeded()
                self.updateViews()
            }
        }
    }
    var dateFormatter = EventDateFormatter()
    
    //MARK: - Outlets
    @IBOutlet weak var backToEventsButton: UIButton!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var isFavoriteButton: UIButton!
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var eventCityStateLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        self.updateFavoriteButton()
        
    }
    
    //MARK: - Actions
    
    //This replaces the back button that would normally display on a navigation controller
    @IBAction func backToEventButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //triggers when heart icon is tapped
    @IBAction func isFavoriteButtonTapped(_ sender: Any) {
        guard let event = event else { return }
        
        if isFavorite == false {
            FavoriteController.sharedInstance.addFavorite(from: event.id)
            print("start\(FavoriteController.sharedInstance.favorites.count)end")
        } else {
            FavoriteController.sharedInstance.removeFavoriteUsing(eventID: event.id)
            print("start\(FavoriteController.sharedInstance.favorites)end")
        }
        
        isFavorite.toggle()
        updateFavoriteButton()
    }
    
    
    
    //MARK: - Functions
    
    //Fills in data and displays it to user
    private func updateViews() {
        guard let event = event else { return }
        eventTitleLabel.text = event.title
        eventTimeLabel.text = EventDateFormatter().formatLongDate(apiDate: event.time)
        eventCityStateLabel.text = "\(event.location.city), \(event.location.state)"
        EventController.fetchImage(for: event) { (imageFromCompletion) in
            DispatchQueue.main.async {
                switch imageFromCompletion {
                case .success(let image):
                    self.eventIcon.image = image
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    //Changes heart icon 
    func updateFavoriteButton(){
        guard let event = event else { return }
        for favorite in FavoriteController.sharedInstance.favorites {
            if favorite.id == event.id {
                isFavorite = true
            }
        }
        if isFavorite == true {
            isFavoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            isFavoriteButton.tintColor = .red
        } else {
            isFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            isFavoriteButton.tintColor = .black
        }
    }
    
    
    
}
