//
//  ImageManager.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImageData(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
