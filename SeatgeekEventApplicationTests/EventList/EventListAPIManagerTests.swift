//
//  EventListAPIManagerTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

final class EventListAPIManagerTests: XCTestCase {
    var apiManagerMock: mockEventListAPIManagerTests!
   
    override func setUp() {
        apiManagerMock = mockEventListAPIManagerTests()
    }
    
    override func tearDown() {
        apiManagerMock = nil
    }
}

class mockEventListAPIManagerTests: EventListAPIManagerProtocol {
    var interactor: EventListIntractorProtocol?
    
    func getEventList(completionHandler: @escaping (Result<[Events], NetworkError>) -> ()) {
             
            if let fileUrl = Bundle.main.url(forResource: "EventListTestData", withExtension: "json"){

                let data = try! Data(contentsOf: fileUrl)
                    
                do {
                    let decodedResult = try JSONDecoder().decode(EventsList.self, from: data)
                   
                   DispatchQueue.main.async {
                       completionHandler(.success(decodedResult.events))
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
