//
//  events.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation

struct EventsList: Codable {
    let events: [Events]
}

struct Events: Codable{
    let title: String?
    let type: String?
    let status: String?
    let id:  Int?
    let announce_date: String?
    let visible_until_utc: String?
}
