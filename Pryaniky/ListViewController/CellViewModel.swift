//
//  CellViewModel.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 05.02.2021.
//

import Foundation

protocol CellViewModelProtocol {
    var name: String { get }
    init(data: DataList)
}

class CellViewModel: CellViewModelProtocol {
    
    private let data: DataList
    var name: String {
        data.name ?? ""
    }

    required init(data: DataList) {
        self.data = data
    }
}
