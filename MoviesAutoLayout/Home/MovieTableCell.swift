//
//  MovieTableCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 23.01.2023.
//

import UIKit

class MovieTableCell: UITableViewCell {
    
    static let reuseIdentifier = "MovieTableCell"
    
    var didSelectMovie: ((Movie) -> Void)?

    var movies: [Movie] = [
        Movie.init(rating: " ★ 6.8 ", image: UIImage(named: "pale"), title: "The Pale Blue Eye", genre: "Crime, Horror, Mystery"),
        Movie.init(rating: " ★ 9.5 ", image: UIImage(named: "otto"), title: "A Man Called Otto", genre: "Comedy, Drama"),
        Movie.init(rating: " ★ 7.9 ", image: UIImage(named: "avatarWater"), title: "Avatar: The Way of Water", genre: "Action, Adventure, Fantasy"),
        Movie.init(rating: " ★ 6.7 ", image: UIImage(named: "fortune"), title: "Operation Fortune: Ruse de guerre", genre: "Action, Comedy, Thriller"),
        Movie.init(rating: " ★ 5.5 ", image: UIImage(named: "fabelmans"), title: "The Fabelmans", genre: "Drama")
    ]
    
    let comingMovies = [
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "johnwick"), title: "John Wick: Chapter 4", genre: "Action, Crime, Thriller"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "shazam"), title: "Shazam! Fury of the Gods", genre: "Action, Comedy, Adventure"),
        Movie(rating: " ★ 8.0 ", image: UIImage(named: "antman"), title: "Ant-Man and the Wasp: Quantumania", genre: "Action, Comedy, Adventure"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "creed3"), title: "Creed III", genre: "Drama, Sport"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "renfield"), title: "Renfield", genre: "Comedy, Fantasy, Horror"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "guardians"), title: "Guardians of the Galaxy Vol. 3", genre: "Action, Comedy, Adventure")
    ]
    
    let trendingMovies = [
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "renfield"), title: "Renfield", genre: "Comedy, Fantasy, Horror"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "johnwick"), title: "John Wick: Chapter 4", genre: "Action, Crime, Thriller"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "shazam"), title: "Shazam! Fury of the Gods", genre: "Action, Comedy, Adventure"),
        Movie(rating: " ★ 8.0 ", image: UIImage(named: "antman"), title: "Ant-Man and the Wasp: Quantumania", genre: "Action, Comedy, Adventure"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "creed3"), title: "Creed III", genre: "Drama, Sport"),
        Movie(rating: " ★ 7.5 ", image: UIImage(named: "guardians"), title: "Guardians of the Galaxy Vol. 3", genre: "Action, Comedy, Adventure")
    ]
    
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
        movieCollectionView.backgroundColor = .clear
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(movieCollectionView)
        movieCollectionView.backgroundColor = .clear
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        movieCollectionView.heightAnchor.constraint(equalToConstant: 256).isActive = true
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
        let movie = movies[indexPath.item]
        cell.configure(with: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectMovie?(movies[indexPath.row])
    }
}

