//
//  DetailsViewModel.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 05.02.2021.
//

import UIKit

protocol DetailsViewModelProtocol {
    var name: String { get }
    var picture: UIImage? { get }
    var text: String { get }
    init(data: DataList)
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    private let data: DataList
    
    var name: String {
        data.name ?? ""
    }
    
    var picture: UIImage? {
        if let imageData = ImageManager.shared.getImageData(from: data.data?.url) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    var text: String {
        data.data?.text ?? ""
    }
    
    required init(data: DataList) {
        self.data = data
    }
}
