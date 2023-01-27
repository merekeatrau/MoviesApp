//
//  CastTableViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 26.01.2023.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CastTableViewCell"
    
    var didSelectCast: (() -> Void)?
    
    private let castCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        setupInterface()
        setConstraints()
        
    }
    
    private func setupInterface() {
        
        castCollectionView.register(CastCollectionViewCell.self, forCellWithReuseIdentifier: CastCollectionViewCell.reuseIdentifier)
        contentView.addSubview(castCollectionView)
        
    }
    
    private func setConstraints() {
        
        castCollectionView.translatesAutoresizingMaskIntoConstraints = false
        castCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        castCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        castCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        castCollectionView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
        castCollectionView.heightAnchor.constraint(equalToConstant: 96).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.reuseIdentifier, for: indexPath) as! CastCollectionViewCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectCast?()
    }
    
}

