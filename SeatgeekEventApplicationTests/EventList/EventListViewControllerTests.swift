//
//  EventListViewControllerTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventListViewControllerTests: XCTestCase {
    var viewMock: mockEventListViewControllerTests!
    var presenterMock: mockEventListPresenterTests!
    var events :  [Events]?
    var eventList: EventListViewController?
    var tableview = UITableView()
    

    override func setUp() {
        presenterMock = mockEventListPresenterTests()
        viewMock = mockEventListViewControllerTests(presenter: presenterMock)
        
        eventList = UIStoryboard(name: Constants.EventListViewController, bundle: nil).instantiateViewController(withIdentifier: Constants.EventListViewIdentifire) as? EventListViewController
        eventList?.eventListTable = tableview
        
    }
    
    override func tearDown() {
        viewMock = nil
        presenterMock = nil
    }
    
    func testEventsListError(){
        viewMock?.eventsListError(error: NetworkError.somethingWentWrong)
        XCTAssertTrue(viewMock.eventsListErrorCalled)
    }
    
}

class mockEventListViewControllerTests: EventListViewProtocol {
    
    var presenter: EventListPresenterProtocol?
    var gotEventListCalled = false
    var eventsListErrorCalled = false

   
    init(presenter: EventListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func gotEventList(eventList: [Events]) {
        XCTAssertFalse(eventList.isEmpty)
        XCTAssertTrue(eventList.count == 2)
        gotEventListCalled = true
    }
    
    func eventsListError(error: NetworkError) {
        XCTAssertNotNil(error)
        eventsListErrorCalled = true
    }
    
}
