//
//  ConnectedBleDeviceVC.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol ConnectedBleDeviceVCProtocol: AnyObject {
    
}

class ConnectedBleDeviceVC: UIViewController {

    // MARK: - OUTLETS -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var connectedDeviceNameLabel: UILabel!
    @IBOutlet weak var connectedDeviceRSSI: UILabel!
    
    // MARK: - PROPERTIES -
    
    var presenter: ConnectedBleDevicePresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func updateUI (with device: DeviceEntity) {
        self.connectedDeviceNameLabel.text = device.deviceName
        self.connectedDeviceRSSI.text = device.deviceRSSINumber
    }
}

extension ConnectedBleDeviceVC: ConnectedBleDeviceVCProtocol {
    
}
