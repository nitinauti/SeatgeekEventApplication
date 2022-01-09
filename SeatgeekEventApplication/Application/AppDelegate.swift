//
//  AppDelegate.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        EventListWireFrame().presentEventListModule()
        
        return true
    }


}

