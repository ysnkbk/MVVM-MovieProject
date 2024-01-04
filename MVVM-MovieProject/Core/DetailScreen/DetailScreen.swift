//
//  DetailScreen.swift
//  MVVM-MovieProject
//
//  Created by Yasin Kabak on 3.01.2024.
//

import UIKit

protocol DetailScreenInterface: AnyObject {
    func configureViewComponents()
    func configurePosterImageView()
    func downloaadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverviewLabel()
}

final class DetailScreen: UIViewController {
    private let movie: MovieResult

    private let viewModel = DetailViewModel()

    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overviewLabel: UILabel!

    private let padding: CGFloat = 16

    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension DetailScreen: DetailScreenInterface {
  
    func downloaadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }

    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)

        posterImageView.layer.cornerRadius = 16

        let posterWidth = CGFloat.dWidth * 0.4
        posterImageView.clipsToBounds = true

        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5),
        ])
        posterImageView.backgroundColor = .systemCyan
    }

    func configureViewComponents() {
        view.backgroundColor = .systemBackground
    }
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = movie._title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 3
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),

        ])
    }

    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        let dateString = movie._releaseDate
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let formattedDate: String

        if let date = dateFormatterGet.date(from: dateString) {
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd MMMM yyyy"
            formattedDate = dateFormatterPrint.string(from: date)
            dateLabel.text = "Relase Date \n" + formattedDate
        } else {
            dateLabel.text = "Release Date: " + self.movie._releaseDate
        }
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.numberOfLines = 2
        
        dateLabel.textAlignment = .center
        
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding*3),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }

    func configureOverviewLabel() {
        overviewLabel = UILabel(frame: .zero)
        view.addSubview(overviewLabel)
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        overviewLabel.text = movie._overview
        overviewLabel.font = UIFont.systemFont(ofSize: 20)
        overviewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: padding*2),
            overviewLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            overviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
}

}
