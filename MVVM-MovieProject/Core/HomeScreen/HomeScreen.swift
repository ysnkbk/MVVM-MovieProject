//
//  HomeScreen.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 29.12.2023.
//

import Foundation
import UIKit

protocol HomeScreenInterface : AnyObject{
    func configureVC()
    func configureCollectionView()
}

final class HomeScreen : UIViewController{
    private let viewModel = HomeViewModel()
    private var collectionView : UICollectionView!
    override func viewDidLoad() {
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen : HomeScreenInterface{
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        collectionView.pinToEdgesOfView(view: view)

    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    
    
}


extension HomeScreen : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    
    
}