//
//  EventTableViewCell.swift
//  FetchRewards Coding Exercise
//
//  Created by Nicholas Boleky on 3/17/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var isFavoriteIcon: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    var shouldShowFavoriteIcon = false
    
    //This function decides if the icon should show in the cell on the tableView
    func handleFavoriteIcon() {
        if shouldShowFavoriteIcon == false {
            isFavoriteIcon.image = UIImage()
        } else if shouldShowFavoriteIcon == true {
            isFavoriteIcon.image = UIImage(systemName: "heart.fill")
            isFavoriteIcon.tintColor = .red
        }
    }
}
