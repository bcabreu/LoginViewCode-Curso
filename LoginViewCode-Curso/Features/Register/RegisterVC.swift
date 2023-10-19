//
//  RegisterVC.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 19/10/23.
//

import UIKit

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    
    override func loadView() {
        super.loadView()
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextfieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        
    }

}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        registerScreen?.validaTextField()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension RegisterVC: RegisterScreenProtocol {
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        print("Registro feito com sucesso")
       
    }
    
    
}


