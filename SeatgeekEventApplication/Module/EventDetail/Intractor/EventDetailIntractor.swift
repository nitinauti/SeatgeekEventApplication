//
//  EventDetailIntractor.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation

class EventDetailIntractor: EventDetailIntractorProtocol {
   
    var presenter: EventDetailPresenterProtocol?
    
    var APIManager: EventDetailAPIManagerProtocol?
    
    func getEventDetail(eventId: Int) {
        APIManager?.getEventDetail(eventId: eventId, completionHandler: { result in
            switch result {
              case .success(let eventDetail):
                self.presenter?.gotEventDetail(eventDetail: eventDetail)
            case .failure(let error): break
                self.presenter?.eventsDetailsError(error: NetworkError.apiError(error))
               }
        })
    }
    
    
}
