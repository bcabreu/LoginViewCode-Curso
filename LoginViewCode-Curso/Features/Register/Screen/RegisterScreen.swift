//
//  RegisterScreen.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 19/10/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedRegisterButton()
    func tappedBackButton()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        button.tintColor = UIColor.mediumBlueColor
        button.setTitleColor(UIColor.mediumBlueColor, for: .normal)
        return button
    }()
    
    @objc private func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.mediumBlueColor
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.textColor = UIColor.backgroundColor
        tf.backgroundColor = UIColor.mediumBlueColor
        tf.attributedPlaceholder = NSAttributedString(
            string: "Digite seu email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlueColor]
        )
//        criando padding para o texto
        let leftPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.textColor = UIColor.backgroundColor
        tf.backgroundColor = UIColor.mediumBlueColor
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite sua senha",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlueColor]
        )
//        Criando padding para o texto
        let leftpaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftView = leftpaddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    public func configTextfieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor.darkBlueColor
        button.isEnabled = false
        button.setTitleColor(UIColor.lightBlueColor, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
    }

    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func validaTextField() {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            registerButton.setTitleColor(UIColor.backgroundColor, for: .normal)
            registerButton.isEnabled = true
        } else {
            registerButton.setTitleColor(UIColor.lightBlueColor, for: .normal)
            registerButton.isEnabled = false
        }
    }
    
    private func addElements() {
        addSubview(backButton)
        addSubview(personImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            personImageView.topAnchor.constraint(equalTo: backButton.topAnchor),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 100),
            personImageView.widthAnchor.constraint(equalToConstant: 100),
            
            emailTextField.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
    
}


