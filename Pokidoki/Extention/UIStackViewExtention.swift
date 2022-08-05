//
//  UIStackViewExtention.swift
//  Pokidoki
//
//  Created by Consultant on 7/16/22.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: Distribution ) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
}
