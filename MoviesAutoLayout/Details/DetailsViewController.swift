//
//  DetailsViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 24.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private var tableView = UITableView()
    private let movieId: Int
    private let detailsService: DetailsService
    private var details: DetailsEntity?
    private var cast: [Cast] = []
    
    init(detailsService: DetailsService, movieId: Int){
        self.detailsService = detailsService
        self.movieId = movieId
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCell.reuseIdentifier)
        tableView.register(DescriptionViewCell.self, forCellReuseIdentifier: DescriptionViewCell.reuseIdentifier)
        tableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        detailsService.loadMovieDetails(with: movieId, failure: { error in
            print(error)
        }, completion: { [weak self] details in
            self?.details = details
            self?.tableView.reloadData()
        })
        
        detailsService.loadCredits(with: movieId, completion: {
            [weak self] cast in
            self?.cast = cast
            self?.tableView.reloadData()
        })
        
        title = "Movie"
        view.backgroundColor = .black
        view.addSubview(tableView)
        setTableView()
    }
    
    private func setTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageViewCell.reuseIdentifier, for: indexPath) as? ImageViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            cell.ratingLabel.text = " ★ \(details?.voteAverage ?? 0.0)  "
            if let image = details?.backdropPath {
                NetworkManager.shared.loadImage(with: image , completion: { imageData in
                    cell.movieImageView.image = UIImage(data: imageData)
                })
            }
            return cell
        }
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionViewCell.reuseIdentifier, for: indexPath) as? DescriptionViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            cell.headerLabel.text = details?.title
            cell.subheaderLabel.text = details?.releaseDate
            cell.descriptionLabel.text = details?.overview
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.reuseIdentifier, for: indexPath) as? CastTableViewCell else {
            return UITableViewCell()
        }
        cell.casts = cast
        cell.didSelectCast = { id in
            let actorVC = ActorViewController(detailsService: DetailsService.shared, actorId: id)
            self.navigationController?.pushViewController(actorVC, animated: true)
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 144
        }
        return UITableView.automaticDimension
    }
}

