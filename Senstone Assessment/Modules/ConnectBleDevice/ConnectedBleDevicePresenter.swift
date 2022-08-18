//
//  ConnectedBleDevicePresenter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import Foundation


protocol ConnectedBleDevicePresenterProtocol: AnyObject {
    func disconnectDevice()
    func didDisconnectDevice()
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
    
    func disconnectDevice() {
        // ASK INTERACTOR to disconnect device
    }
    
    func didDisconnectDevice() {
        // Response from Interactor -> Let know the view
    }
}
