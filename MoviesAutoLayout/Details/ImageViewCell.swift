//
//  ImageViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 26.01.2023.
//

import UIKit

class ImageViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ImageTableCell"
    
    private let movieImageView = UIImageView()
    private let ratingLabel = UILabel()
    private var blurEffect: UIBlurEffect!
    private var blurView: UIVisualEffectView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieImageView)
        movieImageView.addSubview(ratingLabel)
        selectionStyle = .none
        setupInterface()
        setConstraints()
        
    }
    
    private func setupInterface() {
        
        movieImageView.image = UIImage(named: "pale")
        movieImageView.layer.masksToBounds = true
        movieImageView.layer.cornerRadius = 12
        movieImageView.contentMode = .scaleAspectFill
        
        movieImageView.layer.shadowColor = UIColor.white.cgColor
        movieImageView.layer.shadowRadius = 4.0
        movieImageView.layer.shadowOpacity = 0.7
        movieImageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)

        
        ratingLabel.textColor = .white
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 8
        ratingLabel.text = " ★ 8.8 "
        ratingLabel.backgroundColor = .clear
        ratingLabel.layer.shadowColor = UIColor.black.cgColor
        ratingLabel.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        ratingLabel.layer.shadowOpacity = 0.7
        ratingLabel.layer.shadowRadius = 4.0
        ratingLabel.layer.borderWidth = 0.5
        ratingLabel.textAlignment = .center
        ratingLabel.layer.borderColor = UIColor.white.cgColor
        
        blurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = ratingLabel.bounds
        blurView.alpha = 0.4
        ratingLabel.addSubview(blurView)
        
    }
    
    private func setConstraints() {
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        ratingLabel.widthAnchor.constraint(equalToConstant: 56).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        ratingLabel.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 8).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 8).isActive = true
        
        blurView.leadingAnchor.constraint(equalTo: ratingLabel.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: ratingLabel.trailingAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: ratingLabel.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
