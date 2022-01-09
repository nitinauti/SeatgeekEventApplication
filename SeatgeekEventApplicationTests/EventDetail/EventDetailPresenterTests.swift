//
//  EventDetailPresenterTest.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventDetailPresenterTests: XCTestCase {
    var interactorMock: mockEventDetailIntractorTests!
    var presenterMock: mockEventDetailPresenterTests!
    var viewMock: mockEventDetailViewControllerTests!
    var wireFrameMock: mockEventDetailWireFrameTests?
    var network: mockEventDetailAPIManagerTests!
    
    override func setUp() {
        presenterMock = mockEventDetailPresenterTests()
        network = mockEventDetailAPIManagerTests()
        interactorMock = mockEventDetailIntractorTests(presenter: presenterMock, APIManager: network)
        wireFrameMock = mockEventDetailWireFrameTests()
        viewMock = mockEventDetailViewControllerTests(presenter: presenterMock)
        
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
    
    func testGetEventDetail() {
        presenterMock.getEventDetail(eventId: 123456)
        XCTAssertTrue(presenterMock.getEventDetailCalled)
    }
        
}

class mockEventDetailPresenterTests: EventDetailPresenterProtocol {
   
    var view: EventDetailViewProtocol?
    var interactor: EventDetailIntractorProtocol?
    var wireFrame: EventDetailWireFrameProtocol?
    
    var getEventDetailCalled = false
    var gotEventDetailCalled = false

    func getEventDetail(eventId: Int) {
        interactor?.getEventDetail(eventId: eventId)
        getEventDetailCalled = true
    }
    
    func gotEventDetail(eventDetail: EventsDetail) {
        view?.gotEventDetail(eventDetail: eventDetail)
    }
    
    func eventsDetailsError(error: NetworkError) {
        view?.eventsDetailsError(error: error)
    }

}
