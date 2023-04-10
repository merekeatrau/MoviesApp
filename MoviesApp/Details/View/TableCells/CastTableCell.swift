//
//  CastViewCell.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import UIKit
import SnapKit

protocol CastCellDelegate {
    func didSelectCast(with castId: Int)
}

class CastTableViewCell: UITableViewCell {

    static let reuseIdentifier = "CastTableViewCell"

    var castCellDelegate: CastCellDelegate?

    var casts: [Cast] = []{
        didSet {
            castCollectionView.reloadData()
        }
    }

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
        castCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
            $0.height.equalTo(120)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.reuseIdentifier, for: indexPath) as! CastCollectionViewCell
        cell.configure(cast: casts[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 84, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        castCellDelegate?.didSelectCast(with: casts[indexPath.row].id)
    }
}

