//
//  NewsCollectionViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 24.01.2023.
//

import UIKit
import QuartzCore

class NewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsCollectionViewCell"
    private let previewImageView = UIImageView()
    private let ratingLabel = UILabel()
    private let movieTitleLabel = UILabel()
    private let dateTitleLabel = UILabel()
    private var blurEffect: UIBlurEffect!
    private var blurView: UIVisualEffectView!
    private var stackView = UIStackView()
    private let gradientLayer = CAGradientLayer()

    override func layoutSubviews() {
        
        super.layoutSubviews()
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        previewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        previewImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        previewImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: previewImageView.leadingAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: -16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: -16).isActive = true
        
        
        ratingLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: previewImageView.topAnchor, constant: 16).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: previewImageView.leadingAnchor, constant: 16).isActive = true
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: ratingLabel.trailingAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: ratingLabel.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true
        
        layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(previewImageView)
        previewImageView.addSubview(stackView)
        previewImageView.addSubview(ratingLabel)
        contentView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 2
        
        previewImageView.layer.masksToBounds = true
        previewImageView.layer.cornerRadius = 18
        previewImageView.contentMode = .scaleAspectFill
        
        movieTitleLabel.textColor = .white
        movieTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        movieTitleLabel.numberOfLines = 0
        
        dateTitleLabel.textColor = .white
        dateTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dateTitleLabel.layer.opacity = 0.8
        
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.5).cgColor, UIColor.clear.cgColor]
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = contentView.bounds
        previewImageView.layer.addSublayer(gradientLayer)

        ratingLabel.textColor = .white
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 8
        ratingLabel.textAlignment = .center
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
        stackView.addArrangedSubview(movieTitleLabel)
        stackView.addArrangedSubview(dateTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with news: News) {
        movieTitleLabel.text = news.title
        dateTitleLabel.text = news.date
        previewImageView.image = news.preview
        ratingLabel.text = news.rating
    }
    
}
