//
//  EventDetailViewControllerTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
import WebKit
@testable import SeatgeekEventApplication

class EventDetailViewControllerTests: XCTestCase {
    var viewMock: mockEventDetailViewControllerTests!
    var presenterMock: mockEventDetailPresenterTests!
    var eventDetail: EventDetailViewController!
    
    var events : EventsDetail?
    let TitleLbI = UILabel()
    let eventAnnounceDateLBI = UILabel()
    let eventEndDateLBI = UILabel()
    let webview = WKWebView()


    override func setUp() {
        events = EventsDetail(title: "PBR: 2 Day Package", announce_date: "2021-11-18T00:00:00", visible_until_utc: "2022-01-09T00:29:00", url: "https://seatgeek.com//pbr-2-day-package-tickets//rodeo//2022-01-07-3-30-am//5572486")
        presenterMock = mockEventDetailPresenterTests()
        viewMock = mockEventDetailViewControllerTests(presenter: presenterMock)
        
        self.eventDetail = UIStoryboard(name: Constants.EventDetailViewController, bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.EventDetailViewIdentifire) as? EventDetailViewController
        
        self.eventDetail.eventTitle = TitleLbI
        self.eventDetail.eventAnnounceDate = eventAnnounceDateLBI
        self.eventDetail.eventEndDate = eventEndDateLBI
        self.eventDetail.webView = webview
        self.eventDetail.viewDidLoad()
    }
    
    override func tearDown() {
        viewMock = nil
        presenterMock = nil
    }
    
    func testSetup(){
        eventDetail.viewDidLoad()
    }
    
    func testGotEvent(){
        eventDetail.gotEventDetail(eventDetail: events!)
        XCTAssertEqual(eventDetail.eventTitle.text, events?.title)
    }

}

class mockEventDetailViewControllerTests: EventDetailViewProtocol {
   
    
    var presenter: EventDetailPresenterProtocol?
    var gotEventDetailCalled = false
   
    init(presenter: EventDetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func gotEventDetail(eventDetail: EventsDetail) {
        
    }
    
    func eventsDetailsError(error: NetworkError) {
        
    }
    
    
}
