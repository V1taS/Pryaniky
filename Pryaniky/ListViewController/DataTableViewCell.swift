//
//  DataTableViewCell.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 05.02.2021.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    var viewModel: CellViewModelProtocol! {
        didSet {
            textLabel?.text = viewModel.name
        }
    }
}
