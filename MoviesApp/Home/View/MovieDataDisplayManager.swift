//
//  DataDisplayManager.swift
//  MoviesApp
//
//  Created by Mereke on 05.04.2023.
//

import UIKit

final class MovieDataDisplayManager: NSObject, UITableViewDataSource, UITableViewDelegate  {

    var onMovieDidSelect: ((Int) -> Void)?

    var genres: [Genre] = []

    var tempContent = [
        Content(headerTitle: "Now playing", movies: []),
        Content(headerTitle: "Coming soon", movies: []),
        Content(headerTitle: "Trending", movies: [])
    ]

    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewTableCell.identifier, for: indexPath) as? HomeViewTableCell else {
            return UITableViewCell()
        }

        cell.backgroundColor = .clear
        let movies = tempContent[indexPath.section].movies
        cell.configureMovies(data: movies, genres: genres)
        cell.onMovieDidSelect = onMovieDidSelect
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieTableHeader.reuseIdentifier) as? MovieTableHeader else {
            return nil
        }
        header.movieTitleLabel.text = tempContent[section].headerTitle
        return header
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height * 0.4
    }
}
