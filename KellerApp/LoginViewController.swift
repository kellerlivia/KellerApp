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
    
    func tappedSignUp() {
        let vc = CreateAccountViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedForgotPassword() {
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
