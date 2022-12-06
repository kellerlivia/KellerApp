//
//  CreateAccountScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 02/12/22.
//

import UIKit
import Firebase

protocol CreateAccountScreenDelegate: AnyObject {
    func tappedLogin()
    func goHome()
}

class CreateAccountScreen: UIView {
    
    private weak var delegate: CreateAccountScreenDelegate?
    
    public func delegate(_ delegate: CreateAccountScreenDelegate?) {
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
            subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            subImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 35),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            nameTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: self.repeatPasswordTextField.bottomAnchor, constant: 15),
            signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            haveAnAccountLabel.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 190),
            haveAnAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            haveAnAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -170),
            
            logInButton.topAnchor.constraint(equalTo: self.signUpButton.bottomAnchor, constant: 183),
            logInButton.leadingAnchor.constraint(equalTo: self.haveAnAccountLabel.trailingAnchor, constant: 5)
            
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
                    self.delegate?.goHome()
                } else {
                    print("Não foi possível realizar o cadastro")
                }
            }
        } else {
            print("senhas diferentes")
        }
    }
    
    @objc func buttonLogInAction(_ sender: UIButton) {
        delegate?.tappedLogin()
    }
}
