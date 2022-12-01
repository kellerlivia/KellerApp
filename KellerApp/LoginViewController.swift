//
//  LoginViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = LoginScreen()
        self.view = self.screen
    }
}

