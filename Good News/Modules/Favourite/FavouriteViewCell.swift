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
   // var favouriteMovies = MoviesStorage.shared.movies

    static let identifier = "FavouriteMovieTableViewCell"
    private var title: String?

     var favouriteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(data: FavouriteNewsTableViewModel){
        favouriteLabel.text = data.title
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(favouriteLabel)
        setConstrainsts()
   
       
      
    
    }
  
    func setConstrainsts() {
        NSLayoutConstraint.activate([
            favouriteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            favouriteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
 
    func setFavouriteMovie() {
      
    }
    
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
