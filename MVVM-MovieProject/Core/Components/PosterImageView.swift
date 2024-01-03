//
//  PosterImageView.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 2.01.2024.
//

import UIKit

final class PosterImageView: UIImageView {
    
    private var dataTask: URLSessionDataTask!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func downloadImage(movie : MovieResult) {
        guard let url = URL(string: APIURLs.imageUrl(posterPath: movie._posterPath)) else {
            return
             
        }
        dataTask =  NetworkManager.shared.download(url: url,headers: APIHeaders.headers()) { [weak self] result  in
            guard let _ = self else {return}
        }
        dataTask.resume()
    }
    
    func cancelDownload(){
        dataTask.cancel()
        dataTask = nil
    }
}
