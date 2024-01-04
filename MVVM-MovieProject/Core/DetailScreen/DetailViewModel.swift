//
//  DetailViewModel.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 3.01.2024.
//

import Foundation

protocol DetailViewModelInterface{
    var view : DetailScreenInterface? { get set }
    func viewDidLoad()
    
}

final class DetailViewModel{
    weak var view: DetailScreenInterface?
    
}

extension DetailViewModel : DetailViewModelInterface{
    func viewDidLoad() {
        view?.configureViewComponents()
        view?.configurePosterImageView()
        view?.downloaadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
    
    
    
}
