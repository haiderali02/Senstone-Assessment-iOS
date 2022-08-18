//
//  BLEDevicesRouter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation
import UIKit

class BLEDevicesRouter: PresenterToRouterBLEDeviceListProtocol {
    
    static func createModule() -> UINavigationController? {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let bleDevicesViewController = mainStoryBoard.instantiateViewController(withIdentifier: "BLEDevicesViewController") as? BLEDevicesViewController {
            
            
            let presenter: ViewToPresenterBLEDeviceListProtocol & InteractorToPresenterBLEDeviceListProtocol = BLEDevicesPresenter()
            
            bleDevicesViewController.presenter = presenter
            bleDevicesViewController.presenter?.router = BLEDevicesRouter()
            bleDevicesViewController.presenter?.view = bleDevicesViewController
            bleDevicesViewController.presenter?.interactor = BLEDevicesInteractor()
            bleDevicesViewController.presenter?.interactor?.presenter = presenter
            
            let navigationController = UINavigationController(rootViewController: bleDevicesViewController)
            
            
            return navigationController
            
        }
        
        return nil
    }
    
    func pushToConnectedScreen() {
        
    }
    
}
