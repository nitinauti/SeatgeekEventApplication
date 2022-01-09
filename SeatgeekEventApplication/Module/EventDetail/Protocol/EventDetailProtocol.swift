//
//  EventDetailProtocol.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation

protocol EventDetailWireFrameProtocol: class{
    static func presentEventDetailModule(FormView: AnyObject, eventId: Int)
}

protocol EventDetailViewProtocol: class {
    var presenter: EventDetailPresenterProtocol? {set get}
    func gotEventDetail(eventDetail: EventsDetail)
    func eventsDetailsError(error: NetworkError)
}

protocol EventDetailPresenterProtocol: class{
    var view: EventDetailViewProtocol? {set get}
    var interactor: EventDetailIntractorProtocol? {get set}
    var wireFrame: EventDetailWireFrameProtocol? { get set }
    
    func getEventDetail(eventId: Int)
    func gotEventDetail(eventDetail: EventsDetail)
    func eventsDetailsError(error: NetworkError)

}

protocol EventDetailIntractorProtocol: class{
    var presenter: EventDetailPresenterProtocol? {get set}
    var APIManager: EventDetailAPIManagerProtocol? { get set }
    func getEventDetail(eventId: Int)
}

protocol EventDetailAPIManagerProtocol: class{
    var interactor: EventDetailIntractorProtocol? {get set}
    
    func getEventDetail(eventId: Int, completionHandler: @escaping (Result<EventsDetail, NetworkError>) -> ())
}
