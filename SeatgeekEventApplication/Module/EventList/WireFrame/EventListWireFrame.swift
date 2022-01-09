//
//  EventListViewWireFrame.swift
//  SeatgeekEventApplication
//
//  Created by Nitin Auti on 08/01/22.
//

import Foundation

class EventListWireFrame : EventListWireFrameProtocol{
   
    func presentEventListModule() {
        let view : EventListViewProtocol = EventListViewController.instantiate()
        let presenter: EventListPresenterProtocol = EventListPresenter()
        let interactor: EventListIntractorProtocol = EventListIntractor()
        let APIManager: EventListAPIManagerProtocol = EventListAPIManager()
        let wireFrame: EventListWireFrameProtocol = EventListWireFrame()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        interactor.APIManager = APIManager
        APIManager.interactor = interactor
    
        guard let viewController = view as? EventListViewController else { return }
        NavigationHelper.setRootViewController(ViewController:viewController)
    }
    
    func presentEventDetailView(eventid: Int) {
        EventDetailWireFrame.presentEventDetailModule(FormView: EventDetailViewController(), eventId: eventid)
    }
}
