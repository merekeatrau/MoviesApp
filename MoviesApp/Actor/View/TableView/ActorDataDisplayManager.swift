//
//  ActorDataDisplayManager.swift
//  MoviesApp
//
//  Created by Mereke on 10.04.2023.
//

import UIKit

final class ActorDataDisplayManager: NSObject, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifiers = [
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
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ActorTableСell.reuseIdentifier, for: indexPath) as? ActorTableСell else {
                return UITableViewCell()
            }
            cell.backgroundColor = .clear
            return cell
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: BioTableCell.reuseIdentifier, for: indexPath) as? BioTableCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        return cell
    }
}
