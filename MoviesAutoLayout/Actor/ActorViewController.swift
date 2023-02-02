//
//  ActorViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 27.01.2023.
//

import UIKit

class ActorViewController: UIViewController {
    
    private var tableView = UITableView()
    private let actorId: Int
    private let detailsService: DetailsService
    private var actor: Actor?
    
    init(detailsService: DetailsService, actorId: Int){
        self.detailsService = detailsService
        self.actorId = actorId
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ActorTableViewCell.self, forCellReuseIdentifier: ActorTableViewCell.reuseIdentifier)
        tableView.register(BioTableViewCell.self, forCellReuseIdentifier: BioTableViewCell.reuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        detailsService.loadActor(with: actorId, failure: { error in
            print(error)
        }, completion: { [weak self] actor in
                self?.actor = actor
                self?.tableView.reloadData()
        })
        
        title = "Actor"
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

extension ActorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableViewCell.reuseIdentifier, for: indexPath) as? ActorTableViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            if let image = actor?.profilePath {
                NetworkManager.shared.loadImage(with: image , completion: { imageData in
                    cell.actorImageView.image = UIImage(data: imageData)
                })
            }
            cell.bdLabel.text = actor?.birthday
            cell.nameLabel.text = actor?.name
            cell.roleLabel.text = actor?.knownForDepartment
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BioTableViewCell.reuseIdentifier, for: indexPath) as? BioTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.nameLabel.text = actor?.biography
        return cell
    }
}

