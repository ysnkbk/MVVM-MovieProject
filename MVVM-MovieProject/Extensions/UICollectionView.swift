//
//  UICollectionView.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 3.01.2024.
//

import UIKit

extension UICollectionView{
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
