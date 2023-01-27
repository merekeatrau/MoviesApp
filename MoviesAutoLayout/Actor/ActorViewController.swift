//
//  ActorViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 27.01.2023.
//

import UIKit

class ActorViewController: UIViewController {
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ActorTableViewCell.self, forCellReuseIdentifier: ActorTableViewCell.reuseIdentifier)
        tableView.register(BioTableViewCell.self, forCellReuseIdentifier: BioTableViewCell.reuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BioTableViewCell.reuseIdentifier, for: indexPath) as? BioTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        return cell
    }
}

