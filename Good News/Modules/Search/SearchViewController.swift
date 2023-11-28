//
//  SearchViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 12/10/2023.
//


import UIKit

class SearchResultsViewController: UIViewController, UISearchBarDelegate {
    
    public var viewModel: SearchResultViewModel
    
    init(viewModel:SearchResultViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController:SearchResultsViewController(viewModel: viewModel))
        //search.searchBar.searchTextField.textColor = .black
        //search.searchBar.searchTextField.backgroundColor = .white
        //search.searchBar.searchTextField.textColor = .black
        //search.searchBar.barStyle = .black
        //search.searchBar.placeholder = "Search News"
        //search.searchBar.tintColor = .black
        search.searchBar.inputViewController?.definesPresentationContext = true
        search.searchBar.barStyle = .black
        search.searchBar.backgroundImage = UIImage()
        search.searchBar.sizeToFit()
        search.definesPresentationContext = true
       // search.searchBar.backgroundColor = .clear
        
        return search
    }()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SearchItemTableViewCell.self, forCellReuseIdentifier: SearchItemTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        bindReaction()
        

       
    }
    private func setupUI() {
        title = "Search news"
        view.backgroundColor = .white
        view.addSubview(tableView)
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        tableView.backgroundColor = .white
        setupContraints()
     
    }
    
                                
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // viewModel.updateViewModel()
        bindReaction()
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func bindReaction(){
        viewModel.onSuccessfullUpdateReaction = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        
        }
    }
    
 

}

extension SearchResultsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:SearchItemTableViewCell.identifier ,for: indexPath) as? SearchItemTableViewCell else {
            return UITableViewCell()
        }
        let news = viewModel.searchModel[indexPath.row]
        cell.configure(with: news)
        
        return cell
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.searchModel.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

extension SearchResultsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased().replacingOccurrences(of: " ", with: "%20") else {
            return
        }
        
        viewModel.text = text
    }
}

