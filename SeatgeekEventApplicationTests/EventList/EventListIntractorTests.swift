//
//  EventListIntractorTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventListIntractorTests: XCTestCase {
    
    var interactorMock: mockEventListIntractorTests!
    var presenter: mockEventListPresenterTests!
    var APIManager: mockEventListAPIManagerTests!

    override func setUp() {
        presenter = mockEventListPresenterTests()
        APIManager = mockEventListAPIManagerTests()
        interactorMock = mockEventListIntractorTests(presenter: presenter, APIManager: APIManager)
    }
    
    override func tearDown() {
        interactorMock = nil
        presenter = nil
    }
    
    func testGetEventList() {
        interactorMock.getEventList()
        XCTAssertTrue(interactorMock.getEventListcalled)
    }
    
}

class mockEventListIntractorTests: EventListIntractorProtocol {
   
    var APIManager: EventListAPIManagerProtocol?
    var presenter: EventListPresenterProtocol?
    var getEventListcalled: Bool = false

    init(presenter: EventListPresenterProtocol, APIManager: EventListAPIManagerProtocol) {
        self.presenter = presenter
        self.APIManager = APIManager
        
    }
    
    
    func getEventList() {
        getEventListcalled = true
        APIManager?.getEventList(completionHandler: { result in
            switch result {
              case .success(let eventList):
                 print(eventList)
                self.presenter?.gotEventList(eventList: eventList)
            case .failure(let error):
                self.presenter?.eventsListError(error: NetworkError.apiError(error))
               }
        })
    }
    
}
