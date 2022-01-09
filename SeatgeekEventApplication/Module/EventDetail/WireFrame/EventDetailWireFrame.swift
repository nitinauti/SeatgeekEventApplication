//
//  EventDetailWireFrame.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 09/01/22.
//

import Foundation
import UIKit

class EventDetailWireFrame: EventDetailWireFrameProtocol {
 
    static func presentEventDetailModule(FormView: AnyObject, eventId: Int) {
        let view : EventDetailViewProtocol = EventDetailViewController.instantiate()
        let presenter: EventDetailPresenterProtocol = EventDetailPresenter()
        let interactor: EventDetailIntractorProtocol = EventDetailIntractor()
        let APIManager: EventDetailAPIManagerProtocol = EventDetailAPIManager()
        let wireFrame: EventDetailWireFrameProtocol = EventDetailWireFrame()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        interactor.APIManager = APIManager
        APIManager.interactor = interactor
    
        guard let viewController = view as? EventDetailViewController else { return }
        viewController.eventId = eventId
        NavigationHelper.pushViewController(ViewController:viewController)
    }
    
}
