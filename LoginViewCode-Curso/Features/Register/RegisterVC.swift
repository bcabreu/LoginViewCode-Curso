//
//  RegisterVC.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 19/10/23.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    private var registerScreen: RegisterScreen?
    private var auth: Auth?
    private var alert: Alert?
    
    override func loadView() {
        super.loadView()
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.configTextfieldDelegate(delegate: self)
        registerScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
        
    }

}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
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
        
        guard let register = registerScreen else { return }
        
        auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar, verifique os dados e tente novamente")
            } else {
                self.alert?.getAlert(title: "Parabéns", message: "Usuário cadastrado com sucesso!", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
            
            
            
        })
       
    }
    
    
}


