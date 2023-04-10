//
//  ActorViewController.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit
import SnapKit

protocol ActorViewInput: AnyObject {
    func handleObtainedActor(_ actor: [Actor])
}

protocol ActorViewOutput: AnyObject {
    func didLoadView()
}

class ActorViewController: UIViewController {

    var output: ActorViewOutput?
    var dataDisplayManager: ActorDataDisplayManager?

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
        output?.didLoadView()
    }

    private func setupUI() {
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

extension ActorViewController: ActorViewInput {
    func handleObtainedActor(_ actor: [Actor]) {
        dataDisplayManager?.actor = actor
        tableView.reloadData()
    }
}


