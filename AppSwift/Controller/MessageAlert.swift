//
//  MessageAlert.swift
//  AppSwift
//
//  Created by COTEMIG on 30/06/21.
//

import UIKit

extension UIViewController{
    public func showMessageAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true )
        }
        
        alert.addAction(actionCancel)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
