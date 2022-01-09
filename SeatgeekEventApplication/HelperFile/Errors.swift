//
//  Errors.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation

enum Errors {

}

enum NetworkError: Swift.Error, CustomStringConvertible {
    
    case apiError(Swift.Error)
    case noInternetError
    case emptyData
    case decodingError
    case somethingWentWrong
    
    public var description: String {
        switch self {
        case let .apiError(error):
            return "Network Error: \(error.localizedDescription)"
        case .decodingError:
            return "Json Decoding Error."
        case .emptyData:
            return "Empty response from the server"
        case .somethingWentWrong:
            return "Something went wrong."
        case .noInternetError:
             return "No internet connection. Please try again after some time"
        }
    }
}
