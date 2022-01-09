//
//  EventListViewProtocol.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.


protocol EventListWireFrameProtocol: class{
    func presentEventListModule()
    func presentEventDetailView(eventid: Int)
}

protocol EventListViewProtocol: class {
    var presenter: EventListPresenterProtocol? {set get}
    func gotEventList(eventList:[Events])
    func eventsListError(error: NetworkError)
}

protocol EventListPresenterProtocol: class{
    var view: EventListViewProtocol? {set get}
    var interactor: EventListIntractorProtocol? {get set}
    var wireFrame: EventListWireFrameProtocol? { get set }
    
    func getEventList()
    func gotEventList(eventList:[Events])
    func presentEventDetailView(eventid: Int)
    func eventsListError(error: NetworkError)
}

protocol EventListIntractorProtocol: class{
    var presenter: EventListPresenterProtocol? {get set}
    var APIManager: EventListAPIManagerProtocol? { get set }
    func getEventList()
}

protocol EventListAPIManagerProtocol: class{
    var interactor: EventListIntractorProtocol? {get set}
    
    func getEventList(completionHandler: @escaping (Result<[Events], NetworkError>) -> ())
}
