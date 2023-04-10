//
//  MovieCollectionViewCell.swift
//  MoviesApp
//
//  Created by Mereke on 02.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = "MovieCollectionViewCell"

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.4
        imageView.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white.withAlphaComponent(0.8)
        label.numberOfLines = 0
        return label
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 4
        return stackView
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        titleLabel.text = nil
        genresLabel.text = nil
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(posterImageView)
        contentView.addSubview(labelStackView)

        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(genresLabel)

        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        posterImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.72)
        }

        labelStackView.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(posterImageView.snp.width).multipliedBy(0.96)
        }
    }

    func configure(with movie: Movie, genres: [Genre]) {
        let url = URL(string: movie.posterURL ?? "")
        posterImageView.kf.setImage(with: url)
        titleLabel.text = movie.originalTitle
        genresLabel.text = getGenres(by: movie.genreIds, genres: genres)
    }

    func getGenres(by ids: [Int], genres: [Genre]) -> String? {
        var array: [String] = []
        for id in ids {
            array.append(genres.first {$0.id == id}?.name ?? "")
        }
        return array.joined(separator: ", ")
    }
}

