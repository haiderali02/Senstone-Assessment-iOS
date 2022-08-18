//
//  BLEDevicesInteractor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol BluetoothDevicesInteratorProtocol: AnyObject {
    
    func getAllDevices()
    func connectToDevice(device: DeviceEntity)
}

class BluetoothDevicesInterator: NSObject {

    weak var presenter: BluetoothDevicesPresentorProtol?
    let bluetoothManager = BluetoothManager()
}

extension BluetoothDevicesInterator: BluetoothDevicesInteratorProtocol {
    
    func connectToDevice(device: DeviceEntity) {
        bluetoothManager.connectToDevice()
    }
    
    func getAllDevices() {
        bluetoothManager.delegate = self
    }
    
}

extension BluetoothDevicesInterator: BluetoothManagerProtocol {
    
    func didConnectedToDevice() {
        self.presenter?.didConnectedSuccessfully()
    }
    func didReceiveDevices(devices: [DeviceEntity]) {
        self.presenter?.didGetDevices(devices: devices)
    }
    
    func didFailToReceiveDevicesWith(error: String) {

    }
}
