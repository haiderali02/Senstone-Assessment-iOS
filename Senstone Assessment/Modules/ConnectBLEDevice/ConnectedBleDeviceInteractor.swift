//
//  ConnectedBleDeviceInteractor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit
import CoreBluetooth

protocol ConnectedBleDeviceInteractorProtocol: AnyObject {
    func disConnectDevice(_ device: CBPeripheral)
}

class ConnectedBleDeviceInteractor {
    weak var presenter: ConnectedBleDevicePresenterProtocol?
    let blutoothManager = BluetoothManager()
}

extension ConnectedBleDeviceInteractor: ConnectedBleDeviceInteractorProtocol {
    
    func disConnectDevice(_ device: CBPeripheral) {
        blutoothManager.disconnectDevice(device: device)
        blutoothManager.delegate = self
    }
}

extension ConnectedBleDeviceInteractor: BluetoothManagerProtocol {
    func didDisconnectDevice() {
        self.presenter?.didDisconnectedSuccessfully()
    }
}
