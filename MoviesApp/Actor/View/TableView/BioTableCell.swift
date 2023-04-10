//
//  ActorTableCell.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit

class BioTableCell: UITableViewCell {

    static let reuseIdentifier = "BioTableViewCell"

    private var bioStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = ""
        return label
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.layer.opacity = 0.5
        label.text = ""
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface()
        setConstraints()
    }

    private func setupInterface() {
        contentView.addSubview(bioStackView)
        selectionStyle = .none
        bioStackView.addArrangedSubview(nameTitleLabel)
        bioStackView.addArrangedSubview(nameLabel)
    }

    private func setConstraints() {
        bioStackView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(16)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(actor: [Actor]) {
        for cast in actor {
            nameLabel.text = cast.biography
        }
    }
}

