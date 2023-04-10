//
//  MovieTableHeader.swift
//  MoviesApp
//
//  Created by Mereke on 03.04.2023.
//

import UIKit
import SnapKit

class MovieTableHeader: UITableViewHeaderFooterView {

    static let reuseIdentifier = "MovieTableHeader"

    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textAlignment = .left
        return label
    }()

    private let seeAllButton: UIButton = {
        let button = UIButton()
        let chevronImage = UIImage(systemName: "chevron.right")
        button.tintColor = .white
        button.setImage(chevronImage, for: .normal)
        return button
    }()

    private let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fill
        stackview.spacing = 2
        return stackview
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(seeAllButton)
        contentView.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(16)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

