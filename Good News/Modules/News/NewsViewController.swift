//
//  ViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit
import Alamofire



class NewsViewController: UIViewController {

    var viewmodel: NewsViewModel
    
    init(viewmodel: NewsViewModel) {
        self.viewmodel = viewmodel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     lazy var  TableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray6
        title = "News"
        self.tabBarController?.tabBar.barTintColor = .white
        view.addSubview(TableView)
        TableView.delegate = self
        TableView.dataSource = self
        TableView.tintColor = .white
        viewmodel.getNews()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        bindReaction()
    }
    
    func bindReaction(){
        viewmodel.onSuccessfulUpdateReaction = { [weak self] in
            DispatchQueue.main.async {
                self?.TableView.reloadData()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TableView.frame = view.bounds
    
    }
    
}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.newsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        let news = viewmodel.newsViewModel[indexPath.row]
        cell.configure(with: news)

        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewmodel.selectNewsBy(index: indexPath.row)
    }
}
