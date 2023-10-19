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
    
    private var delegate: RegisterScreenProtocol?
    
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
    
    lazy var emailTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .emailAddress
        tf.autocorrectionType = .no
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.textColor = UIColor.backgroundColor
        tf.backgroundColor = UIColor.mediumBlueColor
        tf.attributedPlaceholder = NSAttributedString(
            string: "digite seu email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlueColor]
        )
//        criando padding para o texto
        let leftPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = leftPaddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 8
        tf.textColor = UIColor.backgroundColor
        tf.backgroundColor = UIColor.mediumBlueColor
        tf.attributedPlaceholder = NSAttributedString(
        string: "Digite sua senha",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightBlueColor]
        )
//        Criando padding para o texto
        let leftpaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: tf.frame.height))
        tf.leftView = leftpaddingView
        tf.leftViewMode = .always
        return tf
    }()
    
    public func configTextfieldDelegate(delegate: UITextFieldDelegate) {
        emailTextfield.delegate = delegate
        passwordTextfield.delegate = delegate
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor.darkBlueColor
        button.setTitleColor(UIColor.backgroundColor, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedRegisterButton() {
        delegate?.tappedRegisterButton()
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
    
    private func addElements() {
        addSubview(backButton)
        addSubview(personImageView)
        addSubview(emailTextfield)
        addSubview(passwordTextfield)
        addSubview(registerButton)
    }
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            personImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            personImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 100),
            personImageView.widthAnchor.constraint(equalToConstant: 100),
            
            emailTextfield.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 30),
            emailTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextfield.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 10),
            passwordTextfield.leadingAnchor.constraint(equalTo: emailTextfield.leadingAnchor),
            passwordTextfield.trailingAnchor.constraint(equalTo: emailTextfield.trailingAnchor),
            passwordTextfield.heightAnchor.constraint(equalTo: emailTextfield.heightAnchor),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailTextfield.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextfield.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextfield.heightAnchor)
        ])
    }
    
}
