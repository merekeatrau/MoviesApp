//
//  ViewController.swift
//  MoviesApp
//
//  Created by Mereke on 20.03.2023.
//

import UIKit
import SnapKit

protocol MoviesViewInput: AnyObject {
    func handleObtainedTrendingMovies(movies: [Movie])
    func handleObtainedTodayMovies(movies: [Movie])
    func handleObtainedSoonMovies(movies: [Movie])
    func handleObtainedGenres(genres: [Genre])
}

protocol MoviesViewOutput: AnyObject {
    func didLoadView()
    func didSelectCell(with movieId: Int)
}

class HomeViewController: UIViewController {

    var output: MoviesViewOutput?

    var dataDisplayManager: MovieDataDisplayManager?


    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.contentInset = .zero
        tableView.separatorInset = .zero
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    private let searchController: UISearchController = {
        let searchcontroller = UISearchController(searchResultsController: nil)
        searchcontroller.obscuresBackgroundDuringPresentation = false
        searchcontroller.searchBar.placeholder = "Search"
        return searchcontroller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setNavBar()
        setupTableView()
        output?.didLoadView()
        dataDisplayManager?.onMovieDidSelect = { [weak self] movieId in
            self?.output?.didSelectCell(with: movieId)
        }
    }

    private func setupTableView() {
        tableView.dataSource = dataDisplayManager
        tableView.delegate = dataDisplayManager
        tableView.register(HomeViewTableCell.self, forCellReuseIdentifier: HomeViewTableCell.identifier)
        tableView.register(MovieTableHeader.self, forHeaderFooterViewReuseIdentifier: MovieTableHeader.reuseIdentifier)

        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setNavBar() {
        title = "Discover New Movies"

        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = userButton
        userButton.tintColor = .white
    }
}

extension HomeViewController: MoviesViewInput {
    func handleObtainedGenres(genres: [Genre]) {
        dataDisplayManager?.genres = genres
        self.tableView.reloadData()
    }

    func handleObtainedTrendingMovies(movies: [Movie]) {
        dataDisplayManager?.tempContent[0].movies = movies
    }

    func handleObtainedTodayMovies(movies: [Movie]) {
        dataDisplayManager?.tempContent[1].movies = movies
    }

    func handleObtainedSoonMovies(movies: [Movie]) {
        dataDisplayManager?.tempContent[2].movies = movies
    }
}
