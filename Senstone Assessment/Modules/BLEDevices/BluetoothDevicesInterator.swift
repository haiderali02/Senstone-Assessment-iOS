//
//  BLEDevicesInteractor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit
import CoreBluetooth

protocol BluetoothDevicesInteratorProtocol: AnyObject {
    
    func getAllDevices()
    func connectToDevice(deviceIndex: Int)
}

class BluetoothDevicesInterator: NSObject {

    weak var presenter: BluetoothDevicesPresentorProtol?
    let bluetoothManager = BluetoothManager()
}

extension BluetoothDevicesInterator: BluetoothDevicesInteratorProtocol {
    
    func connectToDevice(deviceIndex: Int) {
        bluetoothManager.connectToDevice(connect: deviceIndex)
    }
    
    func getAllDevices() {
        bluetoothManager.delegate = self
    }
    
}

extension BluetoothDevicesInterator: BluetoothManagerProtocol {
    
    func didConnectedToDevice(_ device: CBPeripheral) {
        self.presenter?.didConnectedSuccessfully(device)
    }
    
    func didReceiveDevices(devices: [DeviceEntity]) {
        self.presenter?.didGetDevices(devices: devices)
    }
    
    func didFailToReceiveDevicesWith(error: String) {

    }
}
