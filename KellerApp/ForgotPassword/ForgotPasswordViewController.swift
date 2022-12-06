//
//  ForgotPasswordViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 01/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
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
    func sendEmailForgotPasswordAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    func tappedSignUp() {
        let vc = CreateAccountViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
