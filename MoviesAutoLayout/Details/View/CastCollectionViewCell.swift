//
//  CastCollectionViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 26.01.2023.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CastCollectionViewCell"
    
    var personImageView = UIImageView()
    var nameLabel = UILabel()
    var characterLabel = UILabel()
    private let stackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setInterface()
        setConstraints()
        
    }
    
    private func setInterface() {
        
        personImageView.layer.masksToBounds = true
        personImageView.layer.cornerRadius = 32
        personImageView.contentMode = .scaleAspectFill
        
        nameLabel.textColor = .white
        nameLabel.text = "Shal"
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0

        characterLabel.textColor = .white
        characterLabel.text = "Toqash"
        characterLabel.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        characterLabel.textAlignment = .center
        characterLabel.numberOfLines = 0
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 1
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(characterLabel)
                
        contentView.addSubview(personImageView)
        contentView.addSubview(stackView)
        
    }
    
    private func setConstraints() {
        
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        personImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        personImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        personImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        personImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 4).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
