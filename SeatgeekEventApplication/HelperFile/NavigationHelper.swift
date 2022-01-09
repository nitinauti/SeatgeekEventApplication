//
//  NavigationHelper.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation
import UIKit

public class NavigationHelper: UINavigationController {
    
    static var window: UIWindow?
    static var RootViewController = UINavigationController()
    
    static func setRootViewController(ViewController: UIViewController){
        window = UIWindow()
        RootViewController = UINavigationController(rootViewController: ViewController)
        window?.rootViewController = RootViewController
        window?.makeKeyAndVisible()
    }
    
    static func pushViewController(ViewController: UIViewController){
        RootViewController.pushViewController(ViewController, animated: true)
    }
    
}
