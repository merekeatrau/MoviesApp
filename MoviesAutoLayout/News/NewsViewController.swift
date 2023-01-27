//
//  NewsViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 22.01.2023.
//

import UIKit

class NewsViewController: UIViewController {

    private var genreCollectionViewManager = GenreViewController()
    
    private var genreCollectionView: UICollectionView {
        genreCollectionViewManager.genreCollectionView
    }
    
    private var newsCollectionViewManager = NewsCollectionViewManager()
    
    private var newsCollectionView: UICollectionView {
        newsCollectionViewManager.newsCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        setupCollectionView()
            
    }
    
    func setupCollectionView() {
        genreCollectionView.register(GenreViewCell.self, forCellWithReuseIdentifier: GenreViewCell.identifier )
        genreCollectionView.dataSource = genreCollectionViewManager
        genreCollectionView.delegate = genreCollectionViewManager
        view.addSubview(genreCollectionView)
        
        newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        newsCollectionView.dataSource = newsCollectionViewManager
        newsCollectionView.delegate = newsCollectionViewManager
        view.addSubview(newsCollectionView)
    
        genreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        genreCollectionView.backgroundColor = .clear
        genreCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        genreCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        genreCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        genreCollectionView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        newsCollectionView.backgroundColor = .clear
        newsCollectionView.topAnchor.constraint(equalTo: genreCollectionView.bottomAnchor, constant: 24).isActive = true
        newsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        newsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        newsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
    }
    
}


