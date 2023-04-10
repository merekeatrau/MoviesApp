//
//  ActorTableCell.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit

class ActorTableСell: UITableViewCell {

    static let reuseIdentifier = "ActorTableViewCell"

    private let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        return imageView
    }()

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let bdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let roleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let nameTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Name"
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let bdTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Birthday"
        return label
    }()

    private let bdLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let roleTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.text = "Department"
        return label
    }()

    private let roleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        nameStackView.addArrangedSubview(nameTitleLabel)
        nameStackView.addArrangedSubview(nameLabel)

        bdStackView.addArrangedSubview(bdTitleLabel)
        bdStackView.addArrangedSubview(bdLabel)

        roleStackView.addArrangedSubview(roleTitleLabel)
        roleStackView.addArrangedSubview(roleLabel)

        textStackView.addArrangedSubview(nameStackView)
        textStackView.addArrangedSubview(bdStackView)
        textStackView.addArrangedSubview(roleStackView)

        mainStackView.addArrangedSubview(actorImageView)
        mainStackView.addArrangedSubview(textStackView)

        contentView.addSubview(mainStackView)

        setConstraints()
    }

    private func setConstraints() {
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.trailing.equalTo(contentView.snp.trailing).inset(16)
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.height.equalTo(160)
        }

        actorImageView.snp.makeConstraints { make in
            make.width.equalTo(160)
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config(actor: Actor) {
//        nameLabel.text = actor.name
//        bdLabel.text = actor.birthday
//        roleLabel.text = actor.knownForDepartment
//        let url = URL(string: actor.profileURL ?? "")
//        actorImageView.kf.setImage(with: url)
    }
}

