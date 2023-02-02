//
//  GenreViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 22.01.2023.
//

import UIKit

class GenreViewCell: UICollectionViewCell {
    
    static let identifier = "GenreViewCell"
    let genreTitleLabel = UILabel()
    private var blurEffect: UIBlurEffect!
    private var blurView: UIVisualEffectView!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        genreTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        genreTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        genreTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        genreTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        genreTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.leadingAnchor.constraint(equalTo: genreTitleLabel.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: genreTitleLabel.trailingAnchor).isActive = true
        blurView.topAnchor.constraint(equalTo: genreTitleLabel.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: genreTitleLabel.bottomAnchor).isActive = true

        layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(genreTitleLabel)
        
        genreTitleLabel.textColor = .white
        genreTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        genreTitleLabel.layer.masksToBounds = true
        genreTitleLabel.backgroundColor = .clear
        genreTitleLabel.layer.shadowColor = UIColor.black.cgColor
        genreTitleLabel.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        genreTitleLabel.layer.shadowOpacity = 0.7
        genreTitleLabel.layer.cornerRadius = 16
        genreTitleLabel.numberOfLines = 0
        genreTitleLabel.lineBreakMode = .byWordWrapping
        genreTitleLabel.sizeToFit()
        genreTitleLabel.layer.shadowRadius = 4.0
        genreTitleLabel.layer.borderWidth = 1
        genreTitleLabel.textAlignment = .center
        genreTitleLabel.layer.borderColor = UIColor.white.cgColor
        blurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = genreTitleLabel.bounds
        blurView.alpha = 0.4
        genreTitleLabel.addSubview(blurView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
