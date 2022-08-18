//
//  ConnectedBleDeviceVC.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit
import CoreBluetooth

protocol ConnectedBleDeviceVCProtocol: AnyObject {
    func didDisconnectedSuccessfully()
}

class ConnectedBleDeviceVC: UIViewController {

    // MARK: - OUTLETS -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var connectedDeviceNameLabel: UILabel!
    @IBOutlet weak var connectedDeviceRSSI: UILabel!
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.clipsToBounds = true
            bgView.layer.cornerRadius = 8
        }
    }
    // MARK: - PROPERTIES -
    
    var presenter: ConnectedBleDevicePresenterProtocol?
    var device: CBPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    func updateUI () {
        self.titleLabel.text = device.name ?? "UnKnown"
        self.descriptionLabel.text = "You are successfully connected to the device named \(device.name ?? "Unknow") with device identifier of \(device.identifier)"
        self.connectedDeviceNameLabel.text = device.name ?? "UnKnown"
        self.connectedDeviceRSSI.text = "\(device.identifier)"
    }
    
    
    // MARK: - ACTIONS -
    
    @IBAction func didTapDisconnect(_ sender: UIButton) {
        self.presenter?.disconnectDevice(self.device)
    }
}

extension ConnectedBleDeviceVC: ConnectedBleDeviceVCProtocol {
    func didDisconnectedSuccessfully() {
        self.navigationController?.popViewController(animated: true)
    }
}
