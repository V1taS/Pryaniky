//
//  DataListViewModel.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import Foundation

protocol DataListViewModelProtocol {
    var listData: [DataList] { get }
    func fetchData(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelProtocol?
    func selectRow(at indexPath: IndexPath)
    func viewModelForSelectedRow() -> DetailsViewModelProtocol?
}

class DataListViewModel: DataListViewModelProtocol {
    
    var listData: [DataList] = []
    var indexPath: IndexPath?
    
    func fetchData(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { pryaniky in
            self.listData = pryaniky.data ?? []
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        listData.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CellViewModelProtocol? {
        let data = listData[indexPath.row]
        return CellViewModel(data: data)
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> DetailsViewModelProtocol? {
        guard let indexPath = indexPath else { return nil }
        let listData = self.listData[indexPath.row]
        return DetailsViewModel(data: listData)
    }
}
