//
//  ActorDataDisplayManager.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit

final class ActorDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {

    var actor: [Actor] = []

    private let cellIdentifiers = [
        IndexPath(row: 0, section: 0): ActorTableСell.reuseIdentifier,
        IndexPath(row: 1, section: 0): BioTableCell.reuseIdentifier
    ]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellIdentifier = cellIdentifiers[indexPath] else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        switch indexPath.row {
        case 0:
            if let actorCell = cell as? ActorTableСell {
                actorCell.config(actor: actor)
            }
        case 1:
            if let bioCell = cell as? BioTableCell {
                bioCell.config(actor: actor)
            }
        default:
            break
        }
        cell.backgroundColor = .clear
        return cell
    }
}
