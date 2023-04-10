//
//  CastCollectionCell.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "CastCollectionViewCell"

    private var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var characterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white.withAlphaComponent(0.8)
        label.text = "Toqash"
        label.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        stackView.spacing = 4
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setInterface()
        setConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        personImageView.layoutIfNeeded()
        let cornerRadius = personImageView.bounds.height / 2.0
        personImageView.layer.cornerRadius = cornerRadius
    }

    private func setInterface() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(characterLabel)
        contentView.addSubview(personImageView)
        contentView.addSubview(stackView)
    }

    private func setConstraints() {
        personImageView.snp.makeConstraints {
            $0.width.height.equalTo(contentView.snp.height).multipliedBy(0.5)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(personImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(cast: Cast) {
        nameLabel.text = cast.originalName
        characterLabel.text = cast.character

        if let profileURL = cast.profileURL {
            personImageView.kf.setImage(with: profileURL)
        } else {
            personImageView.image = UIImage(named: "avatar")
        }
    }
}

