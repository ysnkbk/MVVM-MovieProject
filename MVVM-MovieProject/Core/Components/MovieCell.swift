//
//  CollectionViewCell.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 30.12.2023.
//

import UIKit

final class MovieCell: UICollectionViewCell{
    static let reuseID = "MovieCell"
    private var posterImageView : PosterImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        posterImageView.cancelDownload()

    }
    private func configureCell(){
        backgroundColor = .systemGray5
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.backgroundColor = .systemBlue
        posterImageView.pinToEdgesOfView(view: self)
        
    }
    func setCell(movie : MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
}
