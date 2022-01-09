//
//  EventDetailAPIManagerTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication


final class EventDetailAPIManagerTests: XCTestCase {
    var apiManagerMock: mockEventDetailAPIManagerTests!
   
    override func setUp() {
        apiManagerMock = mockEventDetailAPIManagerTests()
    }
    
    override func tearDown() {
        apiManagerMock = nil
    }
}

class mockEventDetailAPIManagerTests: EventDetailAPIManagerProtocol {
    
    var interactor: EventDetailIntractorProtocol?
    
    func getEventDetail(eventId: Int, completionHandler: @escaping (Result<EventsDetail, NetworkError>) -> ()) {
             
            if let fileUrl = Bundle.main.url(forResource: "EventDetailTestData", withExtension: "json"){

                let data = try! Data(contentsOf: fileUrl)
                    
                do {
                    let decodedResult = try JSONDecoder().decode(EventsDetail.self, from: data)
                   
                   DispatchQueue.main.async {
                       completionHandler(.success(decodedResult))
                    }
                        return
                } catch {
                        DispatchQueue.main.async {
                            completionHandler(.failure(NetworkError.decodingError))
                        }
                        return
                    }
            }
     }
    
}
