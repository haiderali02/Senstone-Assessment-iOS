//
//  BluetoothManager.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 17/08/2022.
//

import Foundation
import CoreBluetooth

protocol BluetoothManagerProtocol: AnyObject {
    func didReceiveDevices(devices: [DeviceEntity])
    func didFailToReceiveDevicesWith(error: String)
    func didConnectedToDevice(_ device: CBPeripheral)
    func didDisconnectDevice()
}

class BluetoothManager: NSObject {
    
    private var centeralManager: CBCentralManager?
    private var peripheralsDevices: [CBPeripheral] = []
    private var devices: [DeviceEntity] = []
    
    weak var delegate: BluetoothManagerProtocol?
    
    override init() {
        super.init()
        self.centeralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    func connectToDevice(connect atIndex: Int) {
        
        let device = peripheralsDevices[atIndex]
        
        centeralManager?.connect(device)
        
    }
    func disconnectDevice(device: CBPeripheral) {
        centeralManager?.cancelPeripheralConnection(device)
        
        // Cancel connection don't provide any call back, So we are adding self handler to notify that the function have triggered!
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.delegate?.didDisconnectDevice()
        }
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("Power Off")
            delegate?.didFailToReceiveDevicesWith(error: "Device Power Off")
        case .poweredOn:
            print("Power On")
            
        case .unknown:
            delegate?.didFailToReceiveDevicesWith(error: "Unable to detect device")
        case .resetting:
            delegate?.didFailToReceiveDevicesWith(error: "Resetting Device")
        case .unsupported:
            delegate?.didFailToReceiveDevicesWith(error: "Device not supported")
        case .unauthorized:
            delegate?.didFailToReceiveDevicesWith(error: "Device unauthorized")
        @unknown default:
            delegate?.didFailToReceiveDevicesWith(error: "Unknown Error")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
       
        let device: DeviceEntity = .init(id: peripheral.identifier, deviceName: peripheral.name ?? "UnKnown", deviceRSSINumber: "\(RSSI)", deviceDescription: peripheral.description)
        
        if !self.peripheralsDevices.contains(peripheral) {
            self.peripheralsDevices.append(peripheral)
        }
        
        if !self.devices.contains(where: { deviceEntity in
            device.id == deviceEntity.id
        }) {
            self.devices.append(device)
        }
        
        self.delegate?.didReceiveDevices(devices: self.devices)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        self.delegate?.didConnectedToDevice(peripheral)
        print("Connected: \(peripheral)")
        
    }
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("Fail to Connect: \(String(describing: error?.localizedDescription))")
    }
}

extension BluetoothManagerProtocol {
    func didReceiveDevices(devices: [DeviceEntity]) {}
    func didFailToReceiveDevicesWith(error: String) {}
    func didConnectedToDevice(_ device: CBPeripheral) {}
    func didDisconnectDevice() {}
}
