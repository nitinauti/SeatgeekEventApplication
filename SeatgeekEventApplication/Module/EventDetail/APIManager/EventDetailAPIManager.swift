//
//  EventDetailAPIManager.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation

class EventDetailAPIManager: EventDetailAPIManagerProtocol {
    var interactor: EventDetailIntractorProtocol?
    
    func getEventDetail(eventId: Int, completionHandler: @escaping (Result<EventsDetail, NetworkError>) -> ()) {
         
        let url = Constants.baseUrl + "2/events/\(eventId)?client_id=\(Constants.clientId)"
         
         let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { Data, response, error -> Void in
             
             guard let data = Data else {
                 completionHandler(.failure(NetworkError.emptyData))
                 return
             }
             
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
            })
         
             task.resume()
        }
  }

