//
//  HomeViewController.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: MenuHomeViewModel = MenuHomeViewModel()
    var screen: HomeScreen?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func loadView() {
        super.loadView()
        self.screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(self)
        screen?.delegate(self)
        viewModel.fetch(.request)
    }
}

//MARK: - Delegate Home

extension HomeViewController: HomeScreenDelegate {
    func signOutHome() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - MenuHomeViewModelDelegate

extension HomeViewController: MenuHomeViewModelDelegate {
    func success() {
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("Deu ruim: \(message)")
    }
}

//MARK: - Delegate e DataSource TableView

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: self.viewModel.titleForSection(section))
        view.expandButton(value: self.viewModel.constainsSection(section))
        return view
    }
    
    @objc func tapSection(_ sender: UIButton) {
        let section = sender.tag
        if self.viewModel.constainsSection(section) {
            self.viewModel.tappedSection(type: .remove, section: section)
            self.screen?.insertRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        } else {
            self.viewModel.tappedSection(type: .insert, section: section)
            self.screen?.deleteRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuHomeTableViewCell.indetifier, for: indexPath) as? MenuHomeTableViewCell
        cell?.setupCell(title: viewModel.titleCell(indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}

