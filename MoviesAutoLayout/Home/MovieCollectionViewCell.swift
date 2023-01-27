//
//  AfishaViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 21.01.2023.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieViewCell"
    
    private let movieImageView = UIImageView()
    private let ratingLabel = UILabel()
    private let movieTitleLabel = UILabel()
    private let genreTitleLabel = UILabel()
    private let titleStackView = UIStackView()
    private var blurEffect: UIBlurEffect!
    private var blurView: UIVisualEffectView!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        
        titleStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        titleStackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 8).isActive = true
        
        ratingLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 8).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 8).isActive = true
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: ratingLabel.trailingAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: ratingLabel.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true
        
        layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(titleStackView)
        movieImageView.addSubview(ratingLabel)
        
        titleStackView.axis = .vertical
        titleStackView.alignment = .leading
        titleStackView.spacing = 2
        
        movieImageView.layer.masksToBounds = true
        movieImageView.layer.cornerRadius = 12
        movieImageView.contentMode = .scaleAspectFill
        movieTitleLabel.textColor = .white
        movieTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        movieTitleLabel.numberOfLines = 0
        
        genreTitleLabel.textColor = .white
        genreTitleLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        genreTitleLabel.layer.opacity = 0.8
        
        ratingLabel.textColor = .white
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 8
        ratingLabel.backgroundColor = .clear
        ratingLabel.layer.shadowColor = UIColor.black.cgColor
        ratingLabel.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        ratingLabel.layer.shadowOpacity = 0.7
        ratingLabel.layer.shadowRadius = 4.0
        ratingLabel.layer.borderWidth = 0.5
        ratingLabel.layer.borderColor = UIColor.white.cgColor
        
        blurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = ratingLabel.bounds
        blurView.alpha = 0.4
        ratingLabel.addSubview(blurView)
        
        titleStackView.addArrangedSubview(movieTitleLabel)
        titleStackView.addArrangedSubview(genreTitleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie) {
        movieTitleLabel.text = movie.title
        genreTitleLabel.text = movie.genre
        movieImageView.image = movie.image
        ratingLabel.text = movie.rating
    }
    
}
