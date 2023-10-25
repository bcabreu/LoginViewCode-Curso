//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 17/10/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    private var auth: Auth?
    private var alert: Alert?
    
    override func loadView() {
        super.loadView()
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.configTextfieldDelegate(delegate: self)
        loginScreen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
      
        loginScreen?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension LoginVC: LoginScreenProtocol {
    
    func tappedLoginButton() {
        
        navigationController?.pushViewController(HomeVC(), animated: true)
       
        guard let login = loginScreen else { return }
        
        auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Atenção, dados incorretos, verifique e tente novamente")
            } else {
                if usuario == nil {
                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    self.alert?.getAlert(title: "Parabéns", message: "usuário logado com sucesso!")
                }
            }
        })
    }
    
    func tappedRegisterButton() {
        navigationController?.pushViewController(RegisterVC(), animated: true)
    }
    
    
}


