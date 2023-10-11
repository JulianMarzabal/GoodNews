//
//  NewsTableViewCell.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    
    
    
     private var  titleNews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        
         label.numberOfLines = 0
       
    
        
         label.text = ""
    
        
        return label
    }()
    
    private var descriptionNews: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    private var separator:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleNews)
        contentView.addSubview(descriptionNews)
        contentView.addSubview(separator)
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
        let SeaparatorConstraints = [
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ]
        NSLayoutConstraint.activate(titleNewsConstraints)
        NSLayoutConstraint.activate(descriptionNewsConstraints)
        NSLayoutConstraint.activate(SeaparatorConstraints)
    }
    
    func configure(with data: NewsModel){
        titleNews.text = data.title
        descriptionNews.text = data.description
    }
}
