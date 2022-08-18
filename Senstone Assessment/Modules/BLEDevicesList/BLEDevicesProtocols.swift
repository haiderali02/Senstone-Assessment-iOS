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
    func setCell(tableView: UITableView, forRowAt IndexPath: IndexPath) -> UITableViewCell
    func didSelectRowAt(index: Int)
    func taBLEViewCellHeight() -> CGFloat
}

// MARK: - View OutPut (Presenter -> View) -

protocol PresenterToViewBLEDeviceListProtocol: AnyObject {
    
    func startBLEServices()
    func stopBLEServices()
    func didReceiveBLEDevices()
    func didFailToReceiveBLEDevices(withError: String)
}

// MARK: - Presenter To Interactor (Presenter -> Interactor) -

protocol PresenterToInteractorBLEDeviceListProtocol: AnyObject {
    
    var presenter: InteractorToPresenterBLEDeviceListProtocol? { get set }
    var availableDevices: [BLEDevice]? { get set }
    func fetchAvailableDevices()
    func makeConnectionWithDevice(at index: Int)
    
}

// MARK: - Interactor To  Presenter (Interactor -> Presenter) -

protocol InteractorToPresenterBLEDeviceListProtocol: AnyObject {
    
    func didFetchBLEDevices(devices: [BLEDevice])
    func didFailToFetchDevices(error: String)
    
}

// MARK: - Presenter To Router (Presenter -> Router) -

protocol PresenterToRouterBLEDeviceListProtocol: AnyObject {
    static func createModule() -> UINavigationController?
    func pushToConnectedScreen() 
}
