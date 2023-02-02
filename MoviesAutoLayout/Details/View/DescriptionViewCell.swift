//
//  DescriptionViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 26.01.2023.
//

import UIKit

class DescriptionViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DescriptionViewCell"
    private let stackView = UIStackView()
    private let secondStackView = UIStackView()
    let headerLabel = UILabel()
    let subheaderLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setInterface()
        setConstraints()
        
    }
    
    private func setInterface() {
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        
        secondStackView.axis = .vertical
        secondStackView.spacing = 2
        secondStackView.alignment = .leading
        secondStackView.distribution = .equalSpacing

        
        headerLabel.numberOfLines = 4
        headerLabel.textColor = .white
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.text = "The Pale Blue Eye"
        
        subheaderLabel.numberOfLines = 0
        subheaderLabel.textColor = .white
        subheaderLabel.text = "Crime, Horror, Mystery"
        subheaderLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.layer.opacity = 0.5
        descriptionLabel.text = "1830 and Detective Landor (Christian Bale) is summoned to the West Point academy to investigate the apparent suicide by hanging of a cadet, whose body was then subsequently mutilated. Unable to get much information from the closed shop academy, he enlists the help of a solitary cadet, one Edgar Allan Poe. Together they start to realise that this did not start with a suicide. Enjoyable who and why dunnit mystery thriller set against the beautiful scenery and equally beautifully filmed backdrop of snow covered New York. Bale is convincing as the tough, canny detective haunted by the death of his wife and the disappearance of his daughter. Harry Melling as a truly eccentric Poe is also on good form delivering a performance just this side of over the top."
        
        secondStackView.addArrangedSubview(headerLabel)
        secondStackView.addArrangedSubview(subheaderLabel)
        stackView.addArrangedSubview(secondStackView)
        stackView.addArrangedSubview(descriptionLabel)
        
        contentView.addSubview(stackView)
        
    }
    
    private func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
