//
//  ViewController.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 17/10/23.
//

import UIKit

class LoginVC: UIViewController {
    
    private var loginScreen: LoginScreen?
    
    override func loadView() {
        super.loadView()
        loginScreen = LoginScreen()
        view = loginScreen
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen?.configTextfieldDelegate(delegate: self)
        loginScreen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        loginScreen?.validateTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension LoginVC: LoginScreenProtocol {
    
    func tappedLoginButton() {
        print("Login chegou na VC!")
    }
    
    func tappedRegisterButton() {
        navigationController?.pushViewController(RegisterVC(), animated: true)
    }
    
    
}


