//
//  EventListViewAPIManager.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation
import UIKit

class EventListAPIManager: EventListAPIManagerProtocol {
   
    var interactor: EventListIntractorProtocol?

    func getEventList(completionHandler: @escaping (Result<[Events], NetworkError>) -> ()) {
        
        let url = Constants.baseUrl + "2/events?client_id=\(Constants.clientId)"
         
         let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { Data, response, error -> Void in
             
             guard let data = Data else {
                 completionHandler(.failure(NetworkError.emptyData))
                 return
             }
             
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
            })
         
             task.resume()
        }
    }
