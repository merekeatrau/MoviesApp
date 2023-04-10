//
//  ImageViewCell.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

class ImageTableCell: UITableViewCell {

    static let reuseIdentifier = "ImageTableCell"

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.4
        imageView.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        return imageView
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()

    private let ratingView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
        setupConstraints()
    }

    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(ratingView)
        ratingView.addSubview(ratingLabel)
    }

    private func setupConstraints() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            $0.height.equalTo(160)
        }

        ratingView.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.top).offset(8)
            $0.leading.equalTo(posterImageView.snp.leading).offset(8)
            $0.size.equalTo(CGSize(width: 64, height: 24))
        }

        ratingLabel.snp.makeConstraints {
            $0.edges.equalTo(ratingView.snp.edges)
        }
    }

    func configure(_ details: [DetailsEntity]) {
        guard let detail = details.first else { return }
        ratingLabel.text = "★ \(String(format: "%.1f", detail.voteAverage))"
        ratingView.backgroundColor = detail.voteAverage <= 7 ? .systemOrange : .systemGreen
        posterImageView.kf.setImage(with: detail.posterURL)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

