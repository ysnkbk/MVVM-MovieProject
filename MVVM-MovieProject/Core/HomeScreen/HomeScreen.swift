//
//  HomeScreen.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 29.12.2023.
//

import UIKit

protocol HomeScreenInterface : AnyObject{
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateDetailScreen(movie: MovieResult)
 
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
    func navigateDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailScreen(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
    
    func reloadCollectionView() {
        self.collectionView.reloadOnMainThread()
    }
    
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
        title = "Popular Movies 🍿 "
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getMovieDetail(id: viewModel.movies[indexPath.item]._id)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        guard contentHeight != 0 else { return }
        
        
        if offSet > contentHeight - (2*height) && viewModel.shouldDownloadTrue {
            viewModel.getMovies()
        }
        
    }
    
}
