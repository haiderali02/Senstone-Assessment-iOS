//
//  BLEDevicesProtocol.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation
import UIKit

// MARK: - View Input (View -> Presenter) -

protocol ViewToPresenterBLEDeviceListProtocol: AnyObject {
    
    var view: PresenterToViewBLEDeviceListProtocol? {get set}
    var interactor: PresenterToInteractorBLEDeviceListProtocol?  {get set}
    var router: PresenterToRouterBLEDeviceListProtocol? {get set}
    
    func viewDidLoad()
    func refreshView()
    
    func numberOfRowsInSection() -> Int
    func setCell(tableView: UITableView, forRowAt IndexPath: IndexPath) -> UITableView
    func didSelectRowAt(index: Int)
    func taBLEViewCellHeight() -> CGFloat
}

// MARK: - View OutPut (Presenter -> View) -

protocol PresenterToViewBLEDeviceListProtocol: AnyObject {
    
    func startBLEServices()
    func stopBLEServices()
    func didReceiveBLEDevices()
    func didFailToReceiveBLEDevices()
}

// MARK: - Presenter To Interactor (Presenter -> Interactor) -

protocol PresenterToInteractorBLEDeviceListProtocol: AnyObject {
    
    
    
}

// MARK: - Interactor To  Presenter (Interactor -> Presenter) -

protocol InteractorToPresenterBLEDeviceListProtocol: AnyObject {
    
}

// MARK: - Presenter To Router (Presenter -> Router) -

protocol PresenterToRouterBLEDeviceListProtocol: AnyObject {
    
}
