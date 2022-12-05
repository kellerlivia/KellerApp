//
//  MenuHomeViewModel.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

protocol MenuHomeViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

enum TypeHiddenSection {
    case remove
    case insert
}

class MenuHomeViewModel {
    
    private let service: MenuHomeService = MenuHomeService()
    private weak var delegate: MenuHomeViewModelDelegate?
    private var data: [MenuHome] = []
    private var hiddenSection = Set<Int>()
    
    public func delegate(_ delegate: MenuHomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.hiddenAllSection()
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.hiddenAllSection()
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfSection : Int {
        return self.data.count
    }
    
    public func titleForSection(_ section: Int) -> String {
        return self.data[section].title ?? ""
    }
    
    public func titleCell(_ indexPath: IndexPath) -> String {
        return self.data[indexPath.section].child?[indexPath.row].title ?? ""
    }
    
    public func constainsSection(_ section: Int) -> Bool {
        return self.hiddenSection.contains(section)
    }
    
    public func tappedSection(type: TypeHiddenSection, section: Int) {
        if type == .insert {
            self.hiddenSection.insert(section)
        } else {
            self.hiddenSection.remove(section)
        }
    }
    
    public func indexPathForSection(_ section: Int) -> [IndexPath] {
        var indexPath = [IndexPath]()
        let size = self.childCount(section)
        for row in 0..<size {
            indexPath.append(IndexPath(row: row, section: section))
        }
        return indexPath
    }
    
    private func childCount(_ section: Int) -> Int {
        return self.data[section].child?.count ?? 0
    }
    
    public func numberOfRowsInSection(section: Int) -> Int {
        if self.constainsSection(section) {
            return 0
        } else {
            return self.childCount(section)
        }
    }
    
    private func hiddenAllSection() {
        let size = self.numberOfSection
        for index in 0..<size {
            self.hiddenSection.insert(index)
        }
    }
}
