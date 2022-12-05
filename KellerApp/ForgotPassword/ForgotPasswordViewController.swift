//
//  ForgotPasswordViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController, LoginScreenDelegate {
    
    let screen: ForgotPasswordScreen = ForgotPasswordScreen()
    
    override func loadView() {
        super.loadView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(self)
    }
}

//MARK: - Delegate

extension ForgotPasswordViewController: ForgotPasswordScreenDelegate {
    
    func tappedSignUp() {
        let vc = CreateAccountViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedForgotPassword() {
        print(#function)
    }
}
