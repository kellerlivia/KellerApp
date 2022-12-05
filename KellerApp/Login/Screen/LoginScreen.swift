//
//  LoginScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit
import Firebase

protocol LoginScreenDelegate: AnyObject {
    func tappedSignUp()
    func tappedForgotPassword()
    func alertLogin(title: String, message: String)
    func goHome()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenDelegate?
    
    public func delegate(_ delegate: LoginScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "image")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "keller"
        label.textColor = .white
        label.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 60)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = UIColor.white
        txt.textColor = .black
        txt.keyboardType = .default
        txt.borderStyle = .roundedRect
        txt.attributedPlaceholder = NSAttributedString(
            string: "email",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)]
        )
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 12
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.black.cgColor
        return txt
    }()
    
    lazy var passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = UIColor.white
        txt.textColor = .black
        txt.keyboardType = .default
        txt.borderStyle = .roundedRect
        txt.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)]
        )
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 12
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.black.cgColor
        return txt
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonLoginAction), for: .touchUpInside)
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari", size: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonForgotPasswordAction), for: .touchUpInside)
        return button
    }()
    
    lazy var dontHaveAnAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account?"
        label.textColor = .white
        label.font = UIFont(name:"Kohinoor Devanagari", size: 18)
        return label
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonSignUpAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(subImageView)
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(forgotPasswordButton)
        self.addSubview(dontHaveAnAccountLabel)
        self.addSubview(signUpButton)
        self.configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 170),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 12),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 30),
            
            dontHaveAnAccountLabel.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 200),
            dontHaveAnAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 68),
            dontHaveAnAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -155),
            
            signUpButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 193),
            signUpButton.leadingAnchor.constraint(equalTo: self.dontHaveAnAccountLabel.trailingAnchor, constant: 5)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonLoginAction(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { success, error in
            if error == nil {
                self.delegate?.goHome()
            } else {
                self.delegate?.alertLogin(title: "Error!", message: error?.localizedDescription ?? "")
            }
        }
    }
    
    @objc func buttonForgotPasswordAction(_ sender: UIButton) {
        delegate?.tappedForgotPassword()
    }
    
    @objc func buttonSignUpAction(_ sender: UIButton) {
        delegate?.tappedSignUp()
    }
}
