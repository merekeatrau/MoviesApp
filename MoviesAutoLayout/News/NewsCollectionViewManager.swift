//
//  NewsCollectionViewManager.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 24.01.2023.
//

import UIKit

class NewsCollectionViewManager: UIViewController {

    var news: [News] = [
        News(preview: UIImage(named: "creed3"), rating: " ★ 6.8 ", title: "Babylon", date: "Dec 26, 2022"),
        News(preview: UIImage(named: "avatarWater"), rating: " ★ 7.0 ", title: "Empire of Light", date: "Sept 13, 2022"),
        News(preview: UIImage(named: "johnwick"), rating: " ★ 5.6 ", title: "The Menu", date: "Nov 18, 2022"),
        News(preview: UIImage(named: "fortune"), rating: " ★ 7.3 ", title: "Devotion", date: "Nov 27, 2022"),
        News(preview: UIImage(named: "antman"), rating:  "★ 7.9 ", title: "When You Finish Saving the World", date: "Jan 22, 2023"),
        News(preview: UIImage(named: "fabelmans"), rating: " ★ 8.8 ", title: "Till", date: "Oct 16, 2022")
    ]
    
    var newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupCollectionView() {
        newsCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier )
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
        newsCollectionView.backgroundColor = .clear
        newsCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NewsCollectionViewManager: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
        let new = news[indexPath.item]
        cell.configure(with: new)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 240)
    }
    
    
}
