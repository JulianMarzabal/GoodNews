//
//  FavouriteViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//


import UIKit

class FavouriteViewController: UIViewController {
    
    let favouriteNewsTableViewCell = FavouriteNewsTableViewCell()
    var favouriteNews: [News] = []
 
  private  lazy var  tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavouriteNewsTableViewCell.self, forCellReuseIdentifier: FavouriteNewsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.delegate = self
      tableView.dataSource = self
        return tableView
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "News Favourite"
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        


       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favouriteNews = NewsStorage.shared.news
        view.backgroundColor = .white
        tableView.removeFromSuperview()
        label.removeFromSuperview()
        view.addSubview(label)
        view.addSubview(tableView)
        setConstraints()
        
       
        
        tableView.reloadData()
    }
    
    
    private func setConstraints() {
        let labelConstraints = [
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -250),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let tableViewConstraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 10)
        ]
        
        
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    



}
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsStorage.shared.news.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let title = favouriteNews[indexPath.row].title
        guard let description = favouriteNews[indexPath.row].description else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteNewsTableViewCell.identifier, for: indexPath) as! FavouriteNewsTableViewCell
        cell.configure(data: .init(title: title, description: description))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _,_, completion in
          
            NewsStorage.shared.news.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
}

