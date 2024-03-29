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
    private lazy var  label: UILabel = {
        let label = UILabel()
        label.text = "Favourite News"
        label.backgroundColor = .systemGray6
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewmodel.showFavouriteNews()
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let tableViewConstraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.newsFavourite.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = viewmodel.newsFavourite[indexPath.row].title
        let description = viewmodel.newsFavourite[indexPath.row].text
        if let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteNewsTableViewCell.identifier, for: indexPath) as? FavouriteNewsTableViewCell {
            cell.configure(data: .init(title: title ?? "", description: description ?? ""))
            return cell
        } else {
            // Manejar el caso en el que la conversión no fue exitosa
            fatalError("No se pudo convertir a FavouriteNewsTableViewCell")
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let newsEntityToDelete = self.viewmodel.newsFavourite[indexPath.row]
        self.viewmodel.eliminateFavouriteNews(entity: newsEntityToDelete)
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] _, _, completion in
            guard let self = self else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
}
