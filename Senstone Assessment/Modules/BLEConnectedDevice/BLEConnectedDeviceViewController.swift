//
//  BLEConnectedDeviceViewController.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

class BLEConnectedDeviceViewController: UIViewController {

    // MARK: - OUTLETS -
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceDescriptionLabel: UILabel!
    @IBOutlet weak var currentDeviceNameLabel: UILabel!
    @IBOutlet weak var currentDeviceRSSILabel: UILabel!
    @IBOutlet weak var disconnectButton: UIButton!
    
    // MARK: - View Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions -

    @IBAction func didTapDisconnect(_ sender: UIButton) {
        
    }
}
