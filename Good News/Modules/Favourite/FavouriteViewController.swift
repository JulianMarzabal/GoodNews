//
//  FavouriteViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//


import UIKit

class FavouriteViewController: UIViewController {
    var viewmodel: FavouriteViewModel
    init(viewmodel: FavouriteViewModel) {
        self.viewmodel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
      
        viewmodel.showFavouriteNews()
        print(" las news favourite\(viewmodel.newsFavourite)")

       
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 4),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -4),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 10)
        ]
        
        
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
    }
    



}
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //return NewsStorage.shared.news.count
        return viewmodel.newsFavourite.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = viewmodel.newsFavourite[indexPath.row].title
        let description = viewmodel.newsFavourite[indexPath.row].text
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteNewsTableViewCell.identifier, for: indexPath) as! FavouriteNewsTableViewCell
        cell.configure(data: .init(title: title ?? "", description: description ?? ""))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _,_, completion in
          
           // NewsStorage.shared.news.remove(at: indexPath.row)
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

