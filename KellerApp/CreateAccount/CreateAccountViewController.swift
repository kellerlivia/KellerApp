//
//  CreateAccountViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 02/12/22.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let screen: CreateAccountScreen = CreateAccountScreen()
    
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

extension CreateAccountViewController: CreateAccountScreenDelegate {
    func goHome() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedLogin() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
