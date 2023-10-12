//
//  SearchNewsTableViewCell.swift
//  Good News
//
//  Created by Julian Marzabal on 12/10/2023.
//

import Foundation
import UIKit
class SearchItemTableViewCell: UITableViewCell {
    
    static let identifier = "SearchItemTableViewCell"

    lazy var imagView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "shakira")
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "As it Was"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Olivia rodrigo"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier  )
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(imagView)
        
   
        
        contentView.backgroundColor = .white
        setContraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setContraints() {
        NSLayoutConstraint.activate([
            imagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10),
            imagView.topAnchor.constraint(lessThanOrEqualTo: contentView.topAnchor, constant: 5),
            imagView.widthAnchor.constraint(equalToConstant: 50),
            imagView.heightAnchor.constraint(equalToConstant: 50),
            //imagView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: imagView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: imagView.trailingAnchor,constant: 20),
           
            
            
        ])
   
    }
    
    

}
