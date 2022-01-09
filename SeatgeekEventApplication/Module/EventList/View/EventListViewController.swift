//
//  EventListViewController.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation
import UIKit

class EventListViewController: UIViewController, EventListViewProtocol {
    
    @IBOutlet weak var eventListTable: UITableView!
    
    var presenter: EventListPresenterProtocol?
    var eventList: [Events] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getEventList()
        self.title = Constants.EventListViewControllerTitile
        eventListTable.register(UINib(nibName: Constants.EventListViewTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.EventListViewTableViewCellIdentifire)
    }
    
    func getEventList(){
        presenter?.getEventList()
    }
    
    func gotEventList(eventList: [Events]) {
        self.eventList = eventList
        eventListTable.reloadData()
    }
    
    func eventsListError(error: NetworkError) {
        print(error)
    }

    static func instantiate() -> EventListViewProtocol {
        return UIStoryboard(name: Constants.EventListViewController, bundle: nil).instantiateViewController(withIdentifier: Constants.EventListViewIdentifire) as! EventListViewController
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = EventListViewTableViewCell()
        
        cell = eventListTable.dequeueReusableCell(withIdentifier: Constants.EventListViewTableViewCellIdentifire , for: indexPath) as! EventListViewTableViewCell
        
        let events: Events = self.eventList[indexPath.row]
        cell.configure(events: events)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let eventId = self.eventList[indexPath.row].id else {
            return
        }
        presenter?.presentEventDetailView(eventid: eventId)
    }
}
