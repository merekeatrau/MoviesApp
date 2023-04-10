//
//  ActorViewController.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit
import SnapKit

class ActorViewController: UIViewController {

    private let dataDisplayManager = ActorDataDisplayManager()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTableView()
    }

    private func setupUI() {
        title = "Actor"
        view.backgroundColor = .black
        view.addSubview(tableView)
    }

    private func setTableView() {
        tableView.register(ActorTableСell.self, forCellReuseIdentifier: ActorTableСell.reuseIdentifier)
        tableView.register(BioTableCell.self, forCellReuseIdentifier: BioTableCell.reuseIdentifier)

        tableView.delegate = dataDisplayManager
        tableView.dataSource = dataDisplayManager

        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}


