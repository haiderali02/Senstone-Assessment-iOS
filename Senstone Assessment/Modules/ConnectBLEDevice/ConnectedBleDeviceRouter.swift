//
//  ConnectedBleDeviceRouter.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 18/08/2022.
//

import Foundation
import UIKit

protocol ConnectedBleDeviceRouterProtocol: AnyObject {
    // Add Protocol Route In Case You Need Further Navigation
}

class ConnectedBleDeviceRouter {
    
    var presenter: ConnectedBleDevicePresenterProtocol?
    static func setupModule() -> ConnectedBleDeviceVC? {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = mainStoryBoard.instantiateViewController(withIdentifier: "ConnectedBleDeviceVC") as? ConnectedBleDeviceVC {
            let interactor = ConnectedBleDeviceInteractor()
            let router = ConnectedBleDeviceRouter()
            let presenter = ConnectedBleDevicePresenter(view: controller, router: router, interactor: interactor)
            
            controller.presenter = presenter
            interactor.presenter = presenter
            router.presenter = presenter
            
            return controller
        }
        return nil
    }
    
}

extension ConnectedBleDeviceRouter: ConnectedBleDeviceRouterProtocol {
    // Implement Here...
}
