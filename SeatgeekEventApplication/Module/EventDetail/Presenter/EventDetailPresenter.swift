//
//  EventDetailPresenter.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation

class EventDetailPresenter: EventDetailPresenterProtocol {
    
    var view: EventDetailViewProtocol?
    var interactor: EventDetailIntractorProtocol?
    var wireFrame: EventDetailWireFrameProtocol?
    
    func getEventDetail(eventId: Int) {
        interactor?.getEventDetail(eventId: eventId)
    }
    
}

extension EventDetailPresenter {
    
    func gotEventDetail(eventDetail: EventsDetail) {
        view?.gotEventDetail(eventDetail: eventDetail)
    }
    
    func eventsDetailsError(error: NetworkError){
        view?.eventsDetailsError(error: error)
    }
}
