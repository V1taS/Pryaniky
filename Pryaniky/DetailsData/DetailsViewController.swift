//
//  DetailsViewController.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 05.02.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var nameLabel = UILabel()
    private var picture: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private var textLabel = UILabel()
    var viewModel: DetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        nameLabel.text = viewModel.name
        picture.image = viewModel.picture
        textLabel.text = viewModel.text
        view.backgroundColor = .white
    }
}


// MARK: - Setup constraints
extension DetailsViewController {
    private func setupConstraints() {
        
        let topStackView = UIStackView(
            arrangedSubviews: [nameLabel,
                               picture,
                               textLabel],
            axis: .vertical,
            spacing: 20
        )
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
