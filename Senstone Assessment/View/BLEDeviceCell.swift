//
//  BLEDeviceCell.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import UIKit
import CoreBluetooth

class BLEDeviceCell: UITableViewCell {

    static let identifier: String = "BLEDeviceCell"
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemBgView: UIView! {
        didSet {
            itemBgView.clipsToBounds = true
            itemBgView.layer.cornerRadius = 8
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(with bleDevice: CBPeripheral) {
        self.deviceNameLabel.text = bleDevice.name ?? "UnNamed"
        self.descriptionLabel.text = "RSSI:"
    }
    
    func setData(with bleDevice: DeviceEntity) {
        self.deviceNameLabel.text = bleDevice.deviceName
        self.descriptionLabel.text = "RSSI: \(bleDevice.deviceRSSINumber)"
    }
}
