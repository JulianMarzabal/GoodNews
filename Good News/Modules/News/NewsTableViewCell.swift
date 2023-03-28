//
//  NewsTableViewCell.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    
    
    
     let titleNews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        
         label.numberOfLines = 0
       
    
        
         label.text = ""
    
        
        return label
    }()
    
    let descriptionNews: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleNews)
        contentView.addSubview(descriptionNews)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        let titleNewsConstraints = [
            titleNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleNews.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titleNews.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            
            
            
        ]
        let descriptionNewsConstraints = [
            descriptionNews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15),
            descriptionNews.topAnchor.constraint(equalTo: titleNews.bottomAnchor,constant: 3),
            descriptionNews.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            descriptionNews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20),
            
            
           
        
        ]
        NSLayoutConstraint.activate(titleNewsConstraints)
        NSLayoutConstraint.activate(descriptionNewsConstraints)
    }
    
    func configure(with data: NewsModel){
        titleNews.text = data.title
        descriptionNews.text = data.description
    }
}
