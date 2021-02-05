//
//  NetworkManager.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let dataURL = "https://pryaniky.com/static/json/sample.json"
    
    private init() {}
    
    func fetchData(completion: @escaping (_ data: Pryaniky) -> Void) {
        guard let url = URL(string: dataURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(Pryaniky.self, from: data)
                completion(data)
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
}
