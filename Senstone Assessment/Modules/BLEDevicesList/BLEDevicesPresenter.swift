//
//  BLEDevicesPresenter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation
import UIKit

class BLEDevicesPresenter: ViewToPresenterBLEDeviceListProtocol {
    
    var bleDevices = [BLEDevice]()
    weak var view: PresenterToViewBLEDeviceListProtocol?
    var interactor: PresenterToInteractorBLEDeviceListProtocol?
    var router: PresenterToRouterBLEDeviceListProtocol?
    
    func viewDidLoad() {
        
        view?.startBLEServices()
        // Ask Interactor to fetch Devices
        interactor?.fetchAvailableDevices()
    }
    
    func refreshView() {
        print("Refresh View")
    }
    
    func numberOfRowsInSection() -> Int {
        return bleDevices.count
    }
    
    func setCell(tableView: UITableView, forRowAt IndexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: BLEDeviceCell.identifier, for: IndexPath) as? BLEDeviceCell {
            
            cell.setData(with: bleDevices[IndexPath.row])
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.makeConnectionWithDevice(at: index)
    }
    
    func taBLEViewCellHeight() -> CGFloat {
        return 100
    }
    
}

extension BLEDevicesPresenter: InteractorToPresenterBLEDeviceListProtocol {
    
    func didFetchBLEDevices(devices: [BLEDevice]) {
        self.bleDevices = devices
        view?.didReceiveBLEDevices()
    }
    
    func didFailToFetchDevices(error: String) {
        view?.stopBLEServices()
        view?.didFailToReceiveBLEDevices(withError: "Failed to load nearby Bluetooth devices: \(error)")
    }
    
}
