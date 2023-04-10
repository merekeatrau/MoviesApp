//
//  HomeViewTableCell.swift
//  MoviesApp
//
//  Created by Mereke on 05.04.2023.
//

import UIKit

class HomeViewTableCell: UITableViewCell, MovieCellDelegate {

    static let identifier = "HomeViewTableCell"

    var onMovieDidSelect: ((Int) -> Void)?

    func didSelectMovie(with id: Int) {
        onMovieDidSelect?(id)
    }

    private let collectionView = MovieCollectionView()

    override func prepareForReuse() {
        collectionView.movieDelegate = self
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        collectionView.movieDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configureMovies(data: [Movie], genres: [Genre]) {
        collectionView.movies = data
        collectionView.genres = genres
    }
}


