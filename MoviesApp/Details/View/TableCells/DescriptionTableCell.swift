//
//  DescriptionViewCell.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import UIKit
import SnapKit

class DescriptionTableCell: UITableViewCell {

    static let reuseIdentifier = "DescriptionTableCell"

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()

    let headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    let subheaderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.8)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label

    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setInterface()
        setConstraints()
    }

    private func setInterface() {
        secondStackView.addArrangedSubview(headerLabel)
        secondStackView.addArrangedSubview(subheaderLabel)
        stackView.addArrangedSubview(secondStackView)
        stackView.addArrangedSubview(descriptionLabel)
        contentView.addSubview(stackView)

    }

    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }

    func configure(_ details: [DetailsEntity]) {
        for detail in details {
            headerLabel.text = detail.title
            subheaderLabel.text = detail.releaseDate
            descriptionLabel.text = detail.overview
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

