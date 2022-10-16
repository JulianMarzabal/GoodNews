//
//  ViewController.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import UIKit
import Alamofire

class NewsViewController: UIViewController {
    
    public var goodNews: [News] = [News]()
    
    private let TableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemGray6
        title = "News"
        
        view.addSubview(TableView)
        TableView.delegate = self
        TableView.dataSource = self
        TableView.reloadData()
        
        
        getNews()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TableView.frame = view.bounds
        
    }
    
    private func getNews(){
        APICaller.shared.getNews { [weak self ]  results in
            switch results {
            case .success(let News):
                self?.goodNews = News
                DispatchQueue.main.async {
                    self?.TableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }


}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
            
        cell.titleNews.text = goodNews[indexPath.row].title
        cell.descriptionNews.text = goodNews[indexPath.row].description
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("apretaste el \(indexPath.row)")
        let infoVC = infoViewController()
        infoVC.modalPresentationStyle = .overFullScreen
        present(infoVC, animated: true)
        infoVC.titleNews.text = goodNews[indexPath.row].title
        infoVC.label.text = goodNews[indexPath.row].content
    }
}
