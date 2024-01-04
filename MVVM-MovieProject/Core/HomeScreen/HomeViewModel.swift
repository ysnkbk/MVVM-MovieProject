//
//  HomeViewModel.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 30.12.2023.
//

import Foundation

protocol HomeViewModelInterface{
    var view : HomeScreenInterface? {get set}
    func viewDidLoad()
    func getMovies()
}

final class HomeViewModel{
    weak var view: HomeScreenInterface?
    private var service = MovieService()
    var movies: [MovieResult] = []
    private var page = 1
    var shouldDownloadTrue = true
}

extension HomeViewModel : HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getMovies()
    }
    func getMovies() {
        shouldDownloadTrue = false
        service.downloadMovies(page: page) { [weak self] returnedMovies in
            guard let self = self else {
                return}
            guard let returnedMovies = returnedMovies else {
                return}
            self.movies.append(contentsOf: returnedMovies)
            self.page += 1
            self.view?.reloadCollectionView()
            shouldDownloadTrue = true

        }
    }
    func getMovieDetail(id: Int) {
        service.getMovieDetail(id: id) { [weak self] returnedMovieDetail in
            guard let self = self else {
                return}
            guard let  returnedMovieDetail = returnedMovieDetail else {
                return}
            self.view?.navigateDetailScreen(movie: returnedMovieDetail )
        }
    }

    
    
    
}
