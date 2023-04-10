//
//  DetailsViewController.swift
//  MoviesApp
//
//  Created by Mereke on 05.04.2023.
//

import UIKit
import SnapKit

protocol DetailsViewInput: AnyObject {
    func handObtainedDetails(_ details: [DetailsEntity])
    func handObtainedCasts(_ casts: [Cast])
}

protocol DetailsViewOutput: AnyObject {
    func didLoadView()
}

class DetailsViewController: UIViewController {

    var output: DetailsViewOutput?

    var dataDisplayManager: DetailsDataDisplayManager?

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 800
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.didLoadView()
        setupNavBar()
        setTableView()
    }

    private func setupNavBar() {
        title = "Movie"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        view.backgroundColor = .black
    }

    private func setTableView() {

        tableView.register(ImageTableCell.self, forCellReuseIdentifier: ImageTableCell.reuseIdentifier)
        tableView.register(DescriptionTableCell.self, forCellReuseIdentifier: DescriptionTableCell.reuseIdentifier)
        tableView.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.reuseIdentifier)

        tableView.delegate = dataDisplayManager
        tableView.dataSource = dataDisplayManager

        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension DetailsViewController: DetailsViewInput {
    func handObtainedCasts(_ casts: [Cast]) {
        dataDisplayManager?.casts = casts
    }

    func handObtainedDetails(_ details: [DetailsEntity]) {
        dataDisplayManager?.details = details
        tableView.reloadData()
    }
}
