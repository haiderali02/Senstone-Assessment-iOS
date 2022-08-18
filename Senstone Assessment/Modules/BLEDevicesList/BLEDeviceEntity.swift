//
//  BLEDevice.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation

struct BLEDevicesList: Decodable {
    var results: [BLEDevice]?
}

struct BLEDevice: Decodable {
    var name: String
    var description: String
    var rssiNumber: String
}
