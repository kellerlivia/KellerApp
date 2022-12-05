//
//  MenuHomeTableViewCellScreen.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit

class MenuHomeTableViewCellScreen: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray.withAlphaComponent(0.1)
        self.addSubview(self.titleLabel)
        self.addSubview(self.lineView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }
}
