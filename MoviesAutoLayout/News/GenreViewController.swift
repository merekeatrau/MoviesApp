//
//  GenreViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 22.01.2023.
//

import UIKit

class GenreViewController: UIViewController {
    
    let filmGenres = ["Action", "Adventure ", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy", "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "TV Movie", "Thriller", "War", "Western"]
    
    var genreCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        genreCollectionView.register(GenreViewCell.self, forCellWithReuseIdentifier: GenreViewCell.identifier)
        genreCollectionView.dataSource = self
        genreCollectionView.delegate = self
        genreCollectionView.backgroundColor = .systemBlue
        genreCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension GenreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filmGenres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreViewCell.identifier, for: indexPath) as! GenreViewCell
        cell.genreTitleLabel.text = filmGenres[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreViewCell.identifier, for: indexPath) as! GenreViewCell
        cell.layoutIfNeeded()
        let width = cell.genreTitleLabel.intrinsicContentSize.width + 100
        return CGSize(width: width, height: 32)
    }
}

