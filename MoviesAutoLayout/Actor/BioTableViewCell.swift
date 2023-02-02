//
//  BioTableViewCell.swift
//  MoviesAutoLayout
//
//  Created by Mereke on 27.01.2023.
//

import UIKit

class BioTableViewCell: UITableViewCell {

    static let reuseIdentifier = "BioTableViewCell"

    private var bioStackView = UIStackView()

    private var nameTitleLabel = UILabel()
    var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bioStackView)
        selectionStyle = .none
        setupInterface()
        setConstraints()
        
    }
    
    private func setupInterface() {
        
        bioStackView.axis = .vertical
        bioStackView.spacing = 4
        bioStackView.alignment = .leading
        bioStackView.distribution = .equalSpacing
        
        nameTitleLabel.numberOfLines = 0
        nameTitleLabel.textColor = .white
        nameTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameTitleLabel.text = "Biography"
        
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        nameLabel.layer.opacity = 0.5
        nameLabel.text = "Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer Jenny (James) and David Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale's childhood, including England, Portugal, and the United States. Bale acknowledges the constant change was one of the influences on his career choice.\r\n His first acting job was a cereal commercial in 1983; amazingly, the next year, he debuted on the West End stage in The Nerd. A role in the 1986 NBC mini-series Anastasia: The Mystery of Anna (1986) caught Steven Spielberg's eye, leading to Bale's well-documented role in Empire of the Sun (1987). For the range of emotions he displayed as the star of the war epic, he earned a special award by the National Board of Review for Best Performance by a Juvenile Actor. \r\n Adjusting to fame and his difficulties with attention (he thought about quitting acting early on), Bale appeared in Kenneth Branagh's 1989 adaptation of Shakespeare's Henry V (1989) and starred as Jim Hawkins in a TV movie version of Treasure Island (1990). Bale worked consistently through the 1990s, acting and singing in Newsies (1992), Swing Kids (1993), Little Women (1994), The Portrait of a Lady (1996), The Secret Agent (1996), Metroland (1997), Velvet Goldmine (1998), All the Little Animals (1998), and A Midsummer Night's Dream (1999). Toward the end of the decade, with the rise of the Internet, Bale found himself becoming one of the most popular online celebrities around, though he, with a couple notable exceptions, maintained a private, tabloid-free mystique."
        
        bioStackView.addArrangedSubview(nameTitleLabel)
        bioStackView.addArrangedSubview(nameLabel)

    }
    
    private func setConstraints() {
        
        bioStackView.translatesAutoresizingMaskIntoConstraints = false
        
        bioStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        bioStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        bioStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bioStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
