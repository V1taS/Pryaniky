//
//  UIStackView.swift
//  Pryaniky
//
//  Created by Vitalii Sosin on 05.02.2021.
//

import Foundation

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     alignment: UIStackView.Alignment = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
}
