//
//  MovieTableHeader.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 23.01.2023.
//

import UIKit

class MovieTableHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "MovieTableHeader"
    
    let movieTitleLabel = UILabel()
    private let seeAllButton = UIButton()
    private let stackView = UIStackView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(seeAllButton)
        contentView.addSubview(stackView)
        movieTitleLabel.textColor = .white
        movieTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        movieTitleLabel.textAlignment = .left
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        seeAllButton.setTitle("See all", for: .normal)
        seeAllButton.setTitleColor(.orange, for: .normal)
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(seeAllButton)
        stackView.axis = .horizontal
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        layoutIfNeeded()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
