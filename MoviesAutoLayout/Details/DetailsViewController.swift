//
//  DetailsViewController.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 24.01.2023.
//

import UIKit

class DetailsViewController: UIViewController  {
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ImageViewCell.self, forCellReuseIdentifier: ImageViewCell.reuseIdentifier)
        tableView.register(DescriptionViewCell.self, forCellReuseIdentifier: DescriptionViewCell.reuseIdentifier)
        tableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "About"
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
            return cell
        }
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionViewCell.reuseIdentifier, for: indexPath) as? DescriptionViewCell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.reuseIdentifier, for: indexPath) as? CastTableViewCell else {
            return UITableViewCell()
        }
        cell.didSelectCast = {
            let actorVC = ActorViewController()
            self.navigationController?.pushViewController(actorVC, animated: true)
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 120
        }
        return UITableView.automaticDimension
    }
    
    
}
