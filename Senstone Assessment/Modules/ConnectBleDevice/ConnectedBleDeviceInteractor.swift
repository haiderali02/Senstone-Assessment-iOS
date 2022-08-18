//
//  ConnectedBleDeviceInteractor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol ConnectedBleDeviceInteractorProtocol: AnyObject {
    func disConnectDevice()
}

class ConnectedBleDeviceInteractor {
    weak var presenter: ConnectedBleDevicePresenterProtocol?
}

extension ConnectedBleDeviceInteractor: ConnectedBleDeviceInteractorProtocol {
    func disConnectDevice() {
        
    }
}
