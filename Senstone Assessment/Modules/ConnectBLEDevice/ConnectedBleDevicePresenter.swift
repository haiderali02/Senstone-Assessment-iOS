//
//  ConnectedBleDevicePresenter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import Foundation
import CoreBluetooth


protocol ConnectedBleDevicePresenterProtocol: AnyObject {
    func disconnectDevice(_ device: CBPeripheral)
    func didDisconnectedSuccessfully()
}

class ConnectedBleDevicePresenter {
    
    unowned var view: ConnectedBleDeviceVCProtocol
    let router: ConnectedBleDeviceRouterProtocol?
    let interactor: ConnectedBleDeviceInteractorProtocol?
    
    init (view: ConnectedBleDeviceVCProtocol, router: ConnectedBleDeviceRouterProtocol, interactor: ConnectedBleDeviceInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension ConnectedBleDevicePresenter: ConnectedBleDevicePresenterProtocol {
    
    func disconnectDevice(_ device: CBPeripheral) {
        self.interactor?.disConnectDevice(device)
    }
    func didDisconnectedSuccessfully() {
        view.didDisconnectedSuccessfully()
    }
}
