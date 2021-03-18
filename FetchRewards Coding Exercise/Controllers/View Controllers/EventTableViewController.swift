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
    
    var events = [Event]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

    
    
}
