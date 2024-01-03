//
//  UIView+Ext.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 30.12.2023.
//

import UIKit

extension UIView {
    func pinToEdgesOfView(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
