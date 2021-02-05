//
//  DataListTableViewController.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 04.02.2021.
//

import UIKit

class DataListTableViewController: UITableViewController {
    
    private let idCell = "dataCell"
    private var viewModel: DataListViewModelProtocol! {
        didSet {
            viewModel.fetchData {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DataListViewModel()
        self.tableView.register(DataTableViewCell.self, forCellReuseIdentifier: idCell)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! DataTableViewCell
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.viewModel = cellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectRow(at: indexPath)
        let viewModelForSelectedRow = viewModel.viewModelForSelectedRow()
        let detailsVC = DetailsViewController()
        detailsVC.viewModel = viewModelForSelectedRow
        detailsVC.modalPresentationStyle = .pageSheet
        self.present(detailsVC, animated: true, completion: nil)
    }
}
