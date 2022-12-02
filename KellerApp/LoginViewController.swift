//
//  LoginViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    var lock: ForgotPasswordScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lock = ForgotPasswordScreen()
        self.view = self.lock
    }
}

