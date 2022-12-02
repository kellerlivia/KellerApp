//
//  ForgotPasswordScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit
import Firebase

class ForgotPasswordScreen: UIView {
    
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
    
    lazy var lockImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "lock")
        image.tintColor = .black
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter your email and we'll send you a link to change a new password"
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
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password", for: .normal)
        button.titleLabel?.font = UIFont(name:"Kohinoor Devanagari Semibold", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
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
        self.addSubview(lockImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(forgotPasswordButton)
        self.addSubview(dontHaveAnAccountLabel)
        self.addSubview(signUpButton)
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
            
            self.lockImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 70),
            self.lockImageView.heightAnchor.constraint(equalToConstant: 108),
            self.lockImageView.widthAnchor.constraint(equalToConstant: 108),
            self.lockImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.lockImageView.bottomAnchor, constant: 15),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 30),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.forgotPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.dontHaveAnAccountLabel.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 200),
            self.dontHaveAnAccountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 68),
            self.dontHaveAnAccountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -155),
            
            self.signUpButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 193),
            self.signUpButton.leadingAnchor.constraint(equalTo: self.dontHaveAnAccountLabel.trailingAnchor, constant: 5)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonForgotPasswordAction(_ sender: UIButton) {
        
    }
    
    @objc func buttonSignUpAction(_ sender: UIButton) {
        
    }
}
