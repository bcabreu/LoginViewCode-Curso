//
//  Alert.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 24/10/23.
//

import UIKit

class Alert: NSObject {
    
    private var controller: UIViewController
        
        init(controller: UIViewController) {
            self.controller = controller
        }
    
    public func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "OK", style: .cancel) { action in
            completion?()
        }
        
        alertController.addAction(cancelar)
        controller.present(alertController, animated: true, completion: nil)
    }
    
    

}
