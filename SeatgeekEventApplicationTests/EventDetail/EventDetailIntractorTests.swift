//
//  EventDetailIntractorTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventDetailIntractorTests: XCTestCase {
    
    var interactorMock: mockEventDetailIntractorTests!
    var presenter: mockEventDetailPresenterTests!
    var APIManager: mockEventDetailAPIManagerTests!

    override func setUp() {
        presenter = mockEventDetailPresenterTests()
        APIManager = mockEventDetailAPIManagerTests()
        interactorMock = mockEventDetailIntractorTests(presenter: presenter, APIManager: APIManager)
    }
    
    override func tearDown() {
        interactorMock = nil
        presenter = nil
    }
    
}

class mockEventDetailIntractorTests: EventDetailIntractorProtocol {
   
    var APIManager: EventDetailAPIManagerProtocol?
    var presenter: EventDetailPresenterProtocol?
    var getEventDetailcalled: Bool = false

    init(presenter: EventDetailPresenterProtocol, APIManager: EventDetailAPIManagerProtocol) {
        self.presenter = presenter
        self.APIManager = APIManager
        
    }
    
    func getEventDetail(eventId: Int) {
        APIManager?.getEventDetail(eventId: eventId, completionHandler: { result in
            switch result {
              case .success(let EventDetail):
                 print(EventDetail)
                self.presenter?.gotEventDetail(eventDetail: EventDetail)
            case .failure(let error):
                self.presenter?.eventsDetailsError(error: NetworkError.apiError(error))
               }
        })
    }
    
}
