//
//  EventListViewTableViewCell.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import UIKit

class EventListViewTableViewCell: UITableViewCell {
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventType: UILabel!
    @IBOutlet weak var eventStatus: UILabel!
    @IBOutlet weak var eventAnnounceDate: UILabel!
    @IBOutlet weak var eventEndDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(events: Events){
        eventTitle.text = events.title
        eventType.text = events.type
        eventAnnounceDate.text = events.announce_date
        eventEndDate.text = events.visible_until_utc
    }
    
}
