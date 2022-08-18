//
//  BluetoothDevicesPresentor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol BluetoothDevicesPresentorProtol: AnyObject {
    func getAllBLEDevices()
    func didGetDevices(devices: [DeviceEntity])
    func connectToDevice(device: DeviceEntity)
    func didConnectedSuccessfully()
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
    
    func didConnectedSuccessfully() {
        self.router?.navigateToConnectedDevice(view: view)
    }
    
    func connectToDevice(device: DeviceEntity) {
        interactor?.connectToDevice(device: device)
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
 
