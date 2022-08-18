//
//  BluetoothDevicesVC.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol BluetoothDevicesVCProtocol: AnyObject {
    func didGetDevices(devices: [DeviceEntity])
    func didFailToGetDevices(with reason: String)
}

class BluetoothDevicesVC: UIViewController {

    
    // MARK: OUTLETS -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    // MARK: - PROPERTIES -
    var presenter: BluetoothDevicesPresentorProtol?
    var devices: [DeviceEntity] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getAllBLEDevices()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.titleLabel.text = "Senstone"
    }
}

extension BluetoothDevicesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: BLEDeviceCell.identifier, for: indexPath) as? BLEDeviceCell {
            
            let device = devices[indexPath.row]
            cell.setData(with: device)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.titleLabel.text = "Connecting..."
        self.presenter?.connectToDevice(deviceIndex: indexPath.row)
       
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available devices"
    }
    
}

extension BluetoothDevicesVC: BluetoothDevicesVCProtocol {
    
    func didGetDevices(devices: [DeviceEntity]) {
        self.devices = devices
    }
    
    func didFailToGetDevices(with reason: String) {
        Utils.showAlert(title: "Alert", description: reason, inViewController: self)
    }
}
