//
//  EventDetailViewController.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation
import UIKit
import WebKit

class EventDetailViewController: UIViewController, EventDetailViewProtocol {
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventAnnounceDate: UILabel!
    @IBOutlet weak var eventEndDate: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    var presenter: EventDetailPresenterProtocol?
    var eventDetail: EventsDetail?
    var eventId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getEventList()
        self.title = Constants.EventDetailViewControllerTitile
    }
    
    func setUpUI(){
        self.eventTitle.text = self.eventDetail?.title
        self.eventAnnounceDate.text = self.eventDetail?.announce_date
        self.eventEndDate.text = self.eventDetail?.visible_until_utc
        
        if let urlString = self.eventDetail?.url, let url = URL(string: urlString) {
            let req = URLRequest(url: url)
            self.webView?.load(req)
        }
    }
    
    func getEventList(){
        presenter?.getEventDetail(eventId: eventId ?? 0)
    }
    
    func gotEventDetail(eventDetail: EventsDetail) {
        self.eventDetail = eventDetail
        self.setUpUI()
    }
    
    func eventsDetailsError(error: NetworkError) {
        print(error)
    }
    
    static func instantiate() -> EventDetailViewProtocol {
        return UIStoryboard(name: Constants.EventDetailViewController, bundle: nil).instantiateViewController(withIdentifier: Constants.EventDetailViewIdentifire) as! EventDetailViewController
    }
}
