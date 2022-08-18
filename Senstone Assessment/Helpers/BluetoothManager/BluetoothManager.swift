//
//  BluetoothManager.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 17/08/2022.
//

import Foundation
import CoreBluetooth

protocol BluetoothManagerProtocol: AnyObject {
    
    func didReceivePeriphrelDevices(devices: [BLEDevice])
    func didFailToReceiveDevicesWith(error: String)
}

class BluetoothManager: NSObject {
    
    private var centeralManager: CBCentralManager?
    private var peripheralsDevices: [CBPeripheral] = []
    
    weak var delegate: BluetoothManagerProtocol?
    
    override init() {
        super.init()
        
        self.centeralManager = CBCentralManager(delegate: self, queue: .main)
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
            self.centeralManager?.scanForPeripherals(withServices: nil)
        case .unknown:
            print("Unable to detect device")
            delegate?.didFailToReceiveDevicesWith(error: "Unable to detect device")
        case .resetting:
            print("Resetting Device")
            delegate?.didFailToReceiveDevicesWith(error: "Resetting Device")
        case .unsupported:
            print("Device not supported")
            delegate?.didFailToReceiveDevicesWith(error: "Device not supported")
        case .unauthorized:
            print("Device unauthorized")
            delegate?.didFailToReceiveDevicesWith(error: "Device unauthorized")
        @unknown default:
            print("Unknown Error")
            delegate?.didFailToReceiveDevicesWith(error: "Unknown Error")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if !self.peripheralsDevices.contains(peripheral) {
            self.peripheralsDevices.append(peripheral)

        }
        
        print("Devices: \(peripheral.name ?? "Some Device") and NUMBNER: \(RSSI)")
        
        var bleDevices: [BLEDevice] = []
        self.peripheralsDevices.forEach { device in
            let bleDevice = BLEDevice(name: device.name ?? "Unnamed Device", description: device.description, rssiNumber: "\(RSSI)")
            bleDevices.append(bleDevice)
        }
        
        self.delegate?.didReceivePeriphrelDevices(devices: bleDevices)
    }
    
}
