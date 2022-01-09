//
//  EventListPresenter.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation

class EventListPresenter: EventListPresenterProtocol {
   
    var view: EventListViewProtocol?
    var interactor: EventListIntractorProtocol?
    var wireFrame: EventListWireFrameProtocol?
    
    func getEventList(){
        interactor?.getEventList()
    }
    
    func presentEventDetailView(eventid: Int) {
        wireFrame?.presentEventDetailView(eventid:eventid)
    }
    
}

extension EventListPresenter {
   
    func gotEventList(eventList:[Events]) {
        view?.gotEventList(eventList: eventList)
    }
    
    func eventsListError(error: NetworkError) {
        view?.eventsListError(error: error)
    }
    
   
}
