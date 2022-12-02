//
//  LoginViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var screen: LoginScreen?
    var create: CreateAccountScreen?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.create = CreateAccountScreen()
        self.view = self.create
    }
}

