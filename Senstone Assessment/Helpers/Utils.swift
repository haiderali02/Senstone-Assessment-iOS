//
//  Utils.swift
//  Senstone Assessment
//
//  Created by Haider Ali on 16/08/2022.
//

import Foundation
import UIKit

class Utils {
    
    static func showAlert(title: String, description: String, inViewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        inViewController.present(alertController, animated: true)
        
    }
    
}
