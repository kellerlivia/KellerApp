//
//  CreateAccountScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 02/12/22.
//

import UIKit
import Firebase

class CreateAccountScreen: UIView {

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
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Just one step you can see what's happened in the world"
        label.textColor = .white
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name:"Kohinoor Devanagari", size: 20)
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
    
    lazy var nameTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = UIColor.white
        txt.textColor = .black
        txt.keyboardType = .default
        txt.borderStyle = .roundedRect
        txt.attributedPlaceholder = NSAttributedString(
            string: "name",
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
    
    lazy var repeatPasswordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = UIColor.white
        txt.textColor = .black
        txt.keyboardType = .default
        txt.borderStyle = .roundedRect
        txt.attributedPlaceholder = NSAttributedString(
            string: "repeat password",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black.withAlphaComponent(0.4)]
        )
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 12
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.black.cgColor
        return txt
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonSignUpAction), for: .touchUpInside)
        return button
    }()
    
    lazy var haveAnAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Have an account?"
        label.textColor = .white
        label.font = UIFont(name:"Kohinoor Devanagari", size: 18)
        return label
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(buttonLogInAction), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(subImageView)
        self.addSubview(titleLabel)
        self.addSubview(emailTextField)
        self.addSubview(nameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(repeatPasswordTextField)
        self.addSubview(descriptionLabel)
        self.addSubview(signUpButton)
        self.addSubview(haveAnAccountLabel)
        self.addSubview(logInButton)
        self.configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 35),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 30),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.repeatPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.repeatPasswordTextField.bottomAnchor, constant: 15),
            self.signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.haveAnAccountLabel.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 190),
            self.haveAnAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            self.haveAnAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -170),
            
            self.logInButton.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 183),
            self.logInButton.leadingAnchor.constraint(equalTo: self.haveAnAccountLabel.trailingAnchor, constant: 5)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonSignUpAction(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let repeatPassword = repeatPasswordTextField.text else { return }
        if repeatPassword == password {
            Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
                if error == nil {
                    print("Cadastrado")
                } else {
                    print("Não foi possível realizar o cadastro")
                }
            }
        } else {
            print("senhas diferentes")
        }
    }
    
    @objc func buttonLogInAction(_ sender: UIButton) {
        
    }
}
