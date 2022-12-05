//
//  MenuHomeService.swift
//  KellerApp
//
//  Created by Livia Carvalho Keller on 05/12/22.
//

import UIKit
import Alamofire

protocol MenuHomeServiceDelegate: GenericService {
    func getMenu(completion: @escaping completion<MenuHomeGroup?>)
    func getMenuFromJson(completion: @escaping completion<MenuHomeGroup?>)
}

class MenuHomeService: MenuHomeServiceDelegate {
    
    func getMenu(completion: @escaping completion<MenuHomeGroup?>) {
        let url: String = "https://run.mocky.io/v3/0c362e74-c8a3-4436-a2c3-a4cf5f0a3794"
        AF.request(url, method: .get).validate().responseDecodable(of: MenuHomeGroup.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getMenuFromJson(completion: @escaping completion<MenuHomeGroup?>) {
        if let url = Bundle.main.url(forResource: "menu", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let menu: MenuHomeGroup = try JSONDecoder().decode(MenuHomeGroup.self, from: data)
                completion(menu, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "menuProfile", error))
            }
        }
    }
}
