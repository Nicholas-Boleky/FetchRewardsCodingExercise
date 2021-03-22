//
//  EventTableViewController.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/18/21.
//

import UIKit

class EventTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var eventSearchBar: UISearchBar!
    @IBOutlet weak var cancelSearchButton: UIButton!
    @IBOutlet weak var eventTableView: UITableView!
    
    
    var events: [Event] = []
    var dateTimeFormatter = EventDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //I dont usually like hard coding the row height. I prefer to have it flexible but I ran out of time to make everything conform to autolayout so this is one of the few items that is hard coded.
        eventTableView.rowHeight = 200
        
        FavoriteController.sharedInstance.loadFromPersistentStore()
        //This code removes the x icon from the search bar to conform to designs in document
        eventSearchBar.setImage(UIImage(), for: UISearchBar.Icon.clear, state: UIControl.State.normal)
        searchBarFormatter()
        //I used a navigation controller but your designs dont have a navigation bar so I used this code to hide the navigation bar
        self.navigationController?.navigationBar.isHidden = true
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //reloads data when navigating back from the detail veiw. This refreshes the heart icon if needed
        eventTableView.reloadData()
    }
    //This button was added to conform to designs. The designs didnt specify what this button does and the built in cancel button on the search bar doesnt do much so I made this button reset the search as well as clear the search field text.
    @IBAction func searchCancelTapped(_ sender: Any) {
        eventSearchBar.text = ""
        events = []
        eventTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else
        { return UITableViewCell() }
        
        let event = events[indexPath.row]
        cell.eventTitleLabel.text = event.title
        cell.cityStateLabel.text = "\(event.location.city), \(event.location.state)"
        cell.eventDateLabel.text = dateTimeFormatter.formatShortDate(apiDate: event.time)
        cell.eventTimeLabel.text = dateTimeFormatter.formatTime(apiDate: event.time)
        EventController.fetchImage(for: event) { (imageFromCompletion) in
            DispatchQueue.main.async {
                switch imageFromCompletion {
                case .success(let image):
                    cell.eventIcon.image = image
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
        //logic to decide if cell shows favorite icon, sets to false by default, then decides if it shoudld show by checking the ID of the event displayed in the cell and comparing it to the array of favorites
        cell.shouldShowFavoriteIcon = false
        for favorite in FavoriteController.sharedInstance.favorites {
            if event.id == favorite.id {
                cell.shouldShowFavoriteIcon = true
            }
        }
        cell.handleFavoriteIcon()
        return cell
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetailVC" {
            let destinationVC = segue.destination as? EventDetailViewController
            guard let indexPath = eventTableView.indexPathForSelectedRow else { return }
            let event = events[indexPath.row]
            destinationVC?.event = event
        }
        
    }
}
extension EventTableViewController: UISearchBarDelegate {
    
    //This touches up the search bar to look like the design specifications
    func searchBarFormatter() {
        eventSearchBar.placeholder = "Search events"
        eventSearchBar.searchTextField.textColor = .white
        eventSearchBar.backgroundColor = .clear
    }
    
    //MARK: - Designs ask for textDidChange to be used but I made alerts when a search fails and that causes a lot of unnecessary alerts if the user doesnt type fast enough, so I am using searchButtonClicked. In the workplace I would reach out to UI/UX or my lead/manager and discuss which method to implement.
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let searchTerm = searchBar.text, searchTerm != "" else { return }
//        EventController.fetchEvent(for: searchTerm) { (eventFromCompletion) in
//
//            DispatchQueue.main.async {
//                switch eventFromCompletion {
//                case .success(let events):
//                    self.events = events
//                case .failure(let error):
//                    self.presentErrorToUser(localizedError: error)
//                }
//                self.eventTableView.reloadData()
//            }
//
//        }
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm != "" else { return }

        EventController.fetchEvent(for: searchTerm) { (eventFromCompletion) in

            DispatchQueue.main.async {
                switch eventFromCompletion {
                case .success(let events):
                    self.events = events
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
                self.eventTableView.reloadData()
            }

        }

    }
}
