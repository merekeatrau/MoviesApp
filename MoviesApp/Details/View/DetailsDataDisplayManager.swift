//
//  DetailsDataDisplayManager.swift
//  MoviesApp
//
//  Created by Mereke on 07.04.2023.
//

import UIKit

final class DetailsDataDisplayManager: NSObject, UITableViewDataSource, UITableViewDelegate, CastCellDelegate {

    func didSelectCast(with castId: Int) {
        onCastDidSelect?(castId)
    }

    var onCastDidSelect: ((Int) -> Void)?

    var details: [DetailsEntity] = []

    var casts: [Cast] = []

//    var didSelectCast: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    let cellIdentifiers = [
        IndexPath(row: 0, section: 0): ImageTableCell.reuseIdentifier,
        IndexPath(row: 1, section: 0): DescriptionTableCell.reuseIdentifier,
        IndexPath(row: 2, section: 0): CastTableViewCell.reuseIdentifier,
    ]

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellIdentifier = cellIdentifiers[indexPath] else {
            return UITableViewCell()
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        switch indexPath.row {
        case 0:
            if let imageCell = cell as? ImageTableCell {
                imageCell.configure(details)
            }
        case 1:
            if let descriptionCell = cell as? DescriptionTableCell {
                descriptionCell.configure(details)
            }
        case 2:
            if let castsCell = cell as? CastTableViewCell {
                castsCell.castCellDelegate = self
                castsCell.casts = casts
            }
        default:
            break
        }
        cell.backgroundColor = .clear
        return cell
    }
}
