//
//  ViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 18.01.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        tableView.estimatedRowHeight = 400
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
            let detailsVC = DetailsViewController()
            self?.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
        if indexPath.section == 0 {
            return cell
        }
        
        if indexPath.section == 1 {
            cell.movies = cell.comingMovies
            return cell
        }
        cell.movies = cell.trendingMovies
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieTableHeader.reuseIdentifier) as? MovieTableHeader else {
            return nil
        }
        if section == 0 {
            header.movieTitleLabel.text = "Now Playing"
            return header
        }
        if section == 1 {
            header.movieTitleLabel.text = "Coming Soon"
            return header
        }
        header.movieTitleLabel.text = "Trending"
        return header
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

}
