//
//  BLEDevicesInteractor.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation
import CoreBluetooth

class BLEDevicesInteractor: PresenterToInteractorBLEDeviceListProtocol {
    
    weak var presenter: InteractorToPresenterBLEDeviceListProtocol?
    
    var availableDevices: [BLEDevice]?
    
    let bluetoothManager = BluetoothManager()
    
    func fetchAvailableDevices() {
        
        self.bluetoothManager.delegate = self
        
    }
    
    func makeConnectionWithDevice(at index: Int) {
        print("Try to make Connection at Index: \(index)")
    }
    
}

extension BLEDevicesInteractor: BluetoothManagerProtocol {
    
    
    func didReceivePeriphrelDevices(devices: [BLEDevice]) {
        
        self.availableDevices = devices
        if let availableDevices = self.availableDevices {
            self.presenter?.didFetchBLEDevices(devices: availableDevices)
        }
        
        
    }
    
    
    func didFailToReceiveDevicesWith(error: String) {
        print("Error Retreive Device: \(error)")
        self.presenter?.didFailToFetchDevices(error: error)
    }
    
}
