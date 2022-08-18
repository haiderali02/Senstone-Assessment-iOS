//
//  DeviceEntity.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import Foundation

struct DeviceEntity: Identifiable {
    var id: UUID
    var deviceName: String
    var deviceRSSINumber: String
    var deviceDescription: String
}
