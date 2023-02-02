//
//  MovieTableCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 23.01.2023.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieTableCell"
    
    private var networkManager = NetworkManager.shared
    private var genres: [Genre] = []
    private var movies: [Movie] = []{
        didSet {
            movieCollectionView.reloadData()
        }
    }
    
    func config(movies: [Movie], genres: [Genre]){
        self.genres = genres
        self.movies = movies
    }
    
    var didSelectMovie: ((Movie) -> Void)?
    
    var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier )
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
        contentView.addSubview(movieCollectionView)
        movieCollectionView.backgroundColor = .clear
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieCollectionView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieTableCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.config(with: movies[indexPath.row], genres: genres)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectMovie?(movies[indexPath.row])
    }
}


