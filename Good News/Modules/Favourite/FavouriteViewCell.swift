//
//  FavouriteViewCell.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//

import Foundation
import UIKit

struct FavouriteNewsTableViewModel {
    var title: String
    var description: String
}

class FavouriteNewsTableViewCell: UITableViewCell {
    static let identifier = "FavouriteMovieTableViewCell"
    private var title: String?

     private lazy var favouriteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
         label.font = .systemFont(ofSize: 18)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       label.text = ""
        label.font = .systemFont(ofSize: 14)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    private lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        return view
    }()
    func configure(data: FavouriteNewsTableViewModel) {
        favouriteLabel.text = data.title
        descriptionLabel.text = data.description
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(favouriteLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separator)
        setConstrainsts()
    }
    func setConstrainsts() {
        NSLayoutConstraint.activate([
            favouriteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            favouriteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            favouriteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            favouriteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ,constant: -15),
            descriptionLabel.topAnchor.constraint(equalTo: favouriteLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
