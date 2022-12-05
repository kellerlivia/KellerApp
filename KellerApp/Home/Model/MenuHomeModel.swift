//
//  MenuHomeModel.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import Foundation

// MARK: - MenuHomeGroup

struct MenuHomeGroup: Codable {
    var group: [MenuHome]?
}

// MARK: - MenuHome

struct MenuHome: Codable {
    var title: String?
    var child: [Item]?
}

// MARK: - Item

struct Item: Codable {
    var title: String?
}
