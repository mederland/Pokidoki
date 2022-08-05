//
//  UIViewExtention.swift
//  Pokidoki
//
//  Created by Consultant on 7/16/22.
//

import UIKit

extension UIView {
    
    func bindToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)) {
        guard let superSafe = self.superview?.safeAreaLayoutGuide else {
            fatalError("Forgot to add the view to view hierarchy. FIX IT!")
        }
        self.topAnchor.constraint(equalTo: superSafe.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superSafe.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superSafe.trailingAnchor, constant: -insets.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superSafe.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}
