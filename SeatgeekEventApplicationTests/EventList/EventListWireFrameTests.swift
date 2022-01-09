//
//  EventListWireFrameTests.swift
//  SeatgeekEventApplicationTests
//
//  Created by Nitin Auti on 09/01/22.
//

import XCTest
@testable import SeatgeekEventApplication

class EventListWireFrameTests: XCTestCase {
    
    var wireFrameMock: mockEventListWireFrameTests!
 
    override func setUp() {
        super.setUp()
        wireFrameMock = mockEventListWireFrameTests()
    }

    override func tearDown() {
       wireFrameMock = nil
    }

    func testPresenteventListModule(){
        wireFrameMock.presentEventListModule()
        XCTAssertTrue(wireFrameMock.presentEventListModuleCalled)
    }
    
    func testPresenteventDetailModule(){
        wireFrameMock.presentEventDetailView(eventid: 123456)
        XCTAssertTrue(wireFrameMock.presentEventDetailViewCalled)
    }
}

class mockEventListWireFrameTests: EventListWireFrameProtocol {
   
    var wireFrame: EventListWireFrameProtocol!

    init(wireframe: EventListWireFrameProtocol = EventListWireFrame()) {
        self.wireFrame = wireframe
    }
   
    var presentEventListModuleCalled = false
    var presentEventDetailViewCalled = false
    
    func presentEventListModule() {
         presentEventListModuleCalled = true
         wireFrame?.presentEventListModule()
    }
    
    func presentEventDetailView(eventid: Int) {
        wireFrame?.presentEventDetailView(eventid: eventid)
        presentEventDetailViewCalled = true
    }
    
}
