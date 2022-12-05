//
//  HomeScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "menu")
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
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect(), style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        tv.register(MenuHomeTableViewCell.self, forCellReuseIdentifier: MenuHomeTableViewCell.indetifier)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(subImageView)
        self.subImageView.addSubview(titleLabel)
        self.addSubview(tableView)
        self.configConstraints()
    }
    
    public func setupDelegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            subImageView.topAnchor.constraint(equalTo: self.topAnchor),
            subImageView.heightAnchor.constraint(equalToConstant: 250),
            subImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 45),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: self.subImageView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func insertRowsTableView(indexPath: [IndexPath], section: Int) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: indexPath, with: .fade)
        self.tableView.reloadSections(IndexSet(integer: section), with: .none)
        self.tableView.endUpdates()
    }
    
    public func deleteRowsTableView(indexPath: [IndexPath], section: Int) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: indexPath, with: .fade)
        self.tableView.reloadSections(IndexSet(integer: section), with: .none)
        self.tableView.endUpdates()
    }
}
