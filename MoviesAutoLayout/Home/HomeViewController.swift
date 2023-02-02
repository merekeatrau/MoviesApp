//
//  ViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 18.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private var networkManager = NetworkManager.shared
    private var genres: [Genre] = []
    
    private var tempContent = [
        Content(headerTitle: "Now playing", movies: []),
        Content(headerTitle: "Coming soon", movies: []),
        Content(headerTitle: "Trending", movies: [])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGenres()
        
        tableView.register(MovieTableHeader.self, forHeaderFooterViewReuseIdentifier: MovieTableHeader.reuseIdentifier)
        tableView.register(MovieTableCell.self, forCellReuseIdentifier: MovieTableCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        let userButton = UIBarButtonItem(image: UIImage(systemName: "newspaper"), style: .plain, target: self, action: #selector(userButtonTapped))
        navigationItem.rightBarButtonItem = userButton
        userButton.tintColor = .white
        view.addSubview(tableView)
        setConstraints()
    }
    
    private func setConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 450
        tableView.backgroundColor = .clear
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func userButtonTapped() {
        let newsVC = NewsViewController()
        navigationController?.pushViewController(newsVC, animated:true)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableCell.reuseIdentifier, for: indexPath) as? MovieTableCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .clear
                
        cell.didSelectMovie = { [weak self] movie in
            let detailsVC = DetailsViewController(detailsService: DetailsService.shared, movieId: movie.id)
            self?.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
        cell.config(movies: tempContent[indexPath.section].movies, genres: genres)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieTableHeader.reuseIdentifier) as? MovieTableHeader else {
            return nil
        }
        header.movieTitleLabel.text = tempContent[section].headerTitle
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}

extension HomeViewController {
    
    private func loadGenres() {
        networkManager.loadGenres { [weak self] genres in
            self?.genres = genres
            self?.loadMovies()
        }
    }
    
    private func loadMovies() {
        networkManager.loadTodayMovies { [weak self] movies in
            self?.tempContent[0].movies = movies
            self?.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
        
        networkManager.loadSoonMovies { [weak self] movies in
            self?.tempContent[1].movies = movies
            self?.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
        }
        
        networkManager.loadTrendingMovies { [weak self] movies in
            self?.tempContent[2].movies = movies
            self?.tableView.reloadSections(IndexSet(integer: 2), with: .automatic)
        }
    }
}
