//
//  BluetoothDevicesPresentor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit
import CoreBluetooth

protocol BluetoothDevicesPresentorProtol: AnyObject {
    func getAllBLEDevices()
    func didGetDevices(devices: [DeviceEntity])
    func connectToDevice(deviceIndex: Int)
    func didConnectedSuccessfully(_ device: CBPeripheral)
}

class BluetoothDevicesPresentor {

    unowned var view: BluetoothDevicesVCProtocol
    let router: BluetoothDevicesRouterProtocol?
    let interactor: BluetoothDevicesInteratorProtocol?
    
    init (view: BluetoothDevicesVCProtocol, router: BluetoothDevicesRouterProtocol, interactor: BluetoothDevicesInteratorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

extension BluetoothDevicesPresentor: BluetoothDevicesPresentorProtol {
    
    func didConnectedSuccessfully(_ device: CBPeripheral) {
        self.router?.navigateToConnectedDevice(view: view, device: device)
    }
    
    func connectToDevice(deviceIndex: Int) {
        interactor?.connectToDevice(deviceIndex: deviceIndex)
    }
    
    func getAllBLEDevices() {
        // Ask Interactor To get Devices
        self.interactor?.getAllDevices()
    }
    
    // Response Received From Interactor
    func didGetDevices(devices: [DeviceEntity]) {
        self.view.didGetDevices(devices: devices)
    }
}
 
