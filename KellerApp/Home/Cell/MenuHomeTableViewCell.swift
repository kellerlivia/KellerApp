//
//  MenuHomeTableViewCell.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit

class MenuHomeTableViewCell: UITableViewCell {
    
    static let indetifier: String = "MenuHomeTableViewCell"
    let screen: MenuHomeTableViewCellScreen = MenuHomeTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    public func setupCell(title: String) {
        self.screen.titleLabel.text = title
    }
}
