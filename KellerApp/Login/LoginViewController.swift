//
//  LoginViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    
    override func loadView() {
        super.loadView()
        screen = LoginScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

//MARK: - Delegate

extension LoginViewController: LoginScreenDelegate {
    func goHome() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func alertLogin(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func tappedSignUp() {
        let vc = CreateAccountViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedForgotPassword() {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    } 
}
