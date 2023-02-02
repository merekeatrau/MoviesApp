//
//  ActorTableViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 27.01.2023.
//

import UIKit

class ActorTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ActorTableViewCell"
    
    var actorImageView = UIImageView()
    
    private var mainStackView = UIStackView()
    private var nameStackView = UIStackView()
    private var bdStackView = UIStackView()
    private var roleStackView = UIStackView()
    private var textStackView = UIStackView()
    
    private var nameTitleLabel = UILabel()
    var nameLabel = UILabel()
    
    private var bdTitleLabel = UILabel()
    var bdLabel = UILabel()
    
    private var roleTitleLabel = UILabel()
    var roleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mainStackView)
        selectionStyle = .none
        setupInterface()
        setConstraints()
        
    }
    
    private func setupInterface() {
        
        actorImageView.layer.masksToBounds = true
        actorImageView.layer.cornerRadius = 12
        actorImageView.contentMode = .scaleAspectFill
        
        mainStackView.axis = .horizontal
        mainStackView.spacing = 16
        mainStackView.alignment = .leading
        mainStackView.distribution = .fillProportionally
        
        textStackView.axis = .vertical
        textStackView.spacing = 8
        textStackView.alignment = .leading
        textStackView.distribution = .equalSpacing
        
        nameStackView.axis = .vertical
        nameStackView.spacing = 2
        nameStackView.alignment = .leading
        nameStackView.distribution = .equalSpacing
        
        bdStackView.axis = .vertical
        bdStackView.spacing = 2
        bdStackView.alignment = .leading
        bdStackView.distribution = .equalSpacing
        
        roleStackView.axis = .vertical
        roleStackView.spacing = 2
        roleStackView.alignment = .leading
        roleStackView.distribution = .equalSpacing
        
        nameStackView.axis = .vertical
        nameStackView.spacing = 2
        nameStackView.alignment = .leading
        nameStackView.distribution = .equalSpacing
        
        nameTitleLabel.numberOfLines = 0
        nameTitleLabel.textColor = .white
        nameTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        nameTitleLabel.text = "Name"
        
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        bdTitleLabel.numberOfLines = 0
        bdTitleLabel.textColor = .white
        bdTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        bdTitleLabel.text = "Birthday"
        
        bdLabel.numberOfLines = 0
        bdLabel.textColor = .white
        bdLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        roleTitleLabel.numberOfLines = 0
        roleTitleLabel.textColor = .white
        roleTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        roleTitleLabel.text = "Department"
        
        roleLabel.numberOfLines = 0
        roleLabel.textColor = .white
        roleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
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
    }
    
    private func setConstraints() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        actorImageView.translatesAutoresizingMaskIntoConstraints = false
        actorImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

