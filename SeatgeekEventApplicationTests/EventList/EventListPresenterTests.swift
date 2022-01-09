//
//  eventListPresenterTest.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventListPresenterTests: XCTestCase {
    var interactorMock: mockEventListIntractorTests!
    var presenterMock: mockEventListPresenterTests!
    var viewMock: mockEventListViewControllerTests!
    var wireFrameMock: mockEventListWireFrameTests?
    var network: mockEventListAPIManagerTests!
    var events :  [Events]? = []
    
    
    
    override func setUp() {
        presenterMock = mockEventListPresenterTests()
        network = mockEventListAPIManagerTests()
        interactorMock = mockEventListIntractorTests(presenter: presenterMock, APIManager: network)
        wireFrameMock = mockEventListWireFrameTests()
        viewMock = mockEventListViewControllerTests(presenter: presenterMock)
        
        presenterMock.interactor = interactorMock
        presenterMock.view = viewMock
        presenterMock.wireFrame = wireFrameMock
       
    }
    
    override func tearDown() {
        presenterMock = nil
        viewMock = nil
        interactorMock = nil
        network = nil
    }
    
    func testGetEventList() {
        presenterMock.getEventList()
        XCTAssertTrue(presenterMock.getEventListCalled)
    }
    
    func testPresentEventdetailModule(){
        presenterMock.presentEventDetailView(eventid: 123456)
        XCTAssertTrue(presenterMock.presentEventDetailViewCalled)
    }
        
}

class mockEventListPresenterTests: EventListPresenterProtocol {
  
    var view: EventListViewProtocol?
    var interactor: EventListIntractorProtocol?
    var wireFrame: EventListWireFrameProtocol?
    
    var getEventListCalled = false
    var gotEventListCalled = false
    var presentEventDetailViewCalled = false

    
    func getEventList() {
        interactor?.getEventList()
        getEventListCalled = true

    }
    
    func gotEventList(eventList: [Events]) {
        view?.gotEventList(eventList: eventList)
        gotEventListCalled = true
    }
    
    func presentEventDetailView(eventid: Int) {
        presentEventDetailViewCalled = true
        wireFrame?.presentEventDetailView(eventid: eventid)
    }
    
    func eventsListError(error: NetworkError) {
        view?.eventsListError(error: error)
    }
    
}
