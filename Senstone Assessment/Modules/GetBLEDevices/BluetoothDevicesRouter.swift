//
//  BluetoothDevicesRouter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import UIKit

protocol BluetoothDevicesRouterProtocol: AnyObject {
    func navigateToConnectedDevice(view: BluetoothDevicesVCProtocol)
}
 
class BluetoothDevicesRouter: NSObject {

    weak var prrsenter: BluetoothDevicesPresentorProtol?
    static func setupModule() -> BluetoothDevicesVC? {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let controller = mainStoryBoard.instantiateViewController(withIdentifier: "BluetoothDevicesVC") as? BluetoothDevicesVC {
            
            let interactor = BluetoothDevicesInterator()
            let router = BluetoothDevicesRouter()
            let presenter = BluetoothDevicesPresentor(view: controller, router: router, interactor: interactor)
            
            controller.presenter = presenter
            interactor.presenter = presenter
            router.prrsenter = presenter
            
            return controller
        }
        return nil
    }
    
}

extension BluetoothDevicesRouter: BluetoothDevicesRouterProtocol {
    func navigateToConnectedDevice(view: BluetoothDevicesVCProtocol) {
        
        if let allDevicesVC = view as? BluetoothDevicesVC {
            if let connectedDeviceVC = ConnectedBleDeviceRouter.setupModule() {
                allDevicesVC.navigationController?.pushViewController(connectedDeviceVC, animated: true)
            }
        }
        
    }
}
