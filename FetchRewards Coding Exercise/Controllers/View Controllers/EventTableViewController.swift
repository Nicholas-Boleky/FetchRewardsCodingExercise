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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        //eventTableView.estimatedRowHeight = 300
        eventTableView.rowHeight = 200
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else
        { return UITableViewCell() }
    
        let event = events[indexPath.row]
        cell.eventTitleLabel.text = event.title
        cell.cityStateLabel.text = "\(event.location.city),\(event.location.state)" 
        cell.eventTimeLabel.text = event.time
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
        print(event.title,event.location,event.title)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

    
    
}

extension EventTableViewController: UISearchBarDelegate {
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
