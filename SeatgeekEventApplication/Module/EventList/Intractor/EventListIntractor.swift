//
//  EventListIntractor.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation

class EventListIntractor: EventListIntractorProtocol {

    var presenter: EventListPresenterProtocol?
    var APIManager: EventListAPIManagerProtocol?
    
    func getEventList() {
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
