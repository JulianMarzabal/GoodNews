//
//  NewsViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 08/01/2023.
//

import Foundation

protocol NewsViewDelegate: AnyObject {
    func showInfoNews(news: News)
}
class NewsViewModel {
    var api: APIProtocol = APICaller.shared
    weak var delegate: NewsViewDelegate?
     var news: [News] = [News]()
    var onSuccessfulUpdateReaction: (() -> Void)?
    var newsViewModel: [NewsModel] = []
     func getNews() {
         api.getNews { [weak self ]  results in
            switch results {
            case .success(let news):
                self?.news = news
                self?.createViewModel()
                self?.updateViewModel()
            case .failure(let error):
                print("que pasoo")
                print(error)
            }
        }
    }
    private func createViewModel() {
        newsViewModel = []
        for peaceOfNews in news {
            newsViewModel.append(.init(title: peaceOfNews.title, description: peaceOfNews.description, content: peaceOfNews.content, image: peaceOfNews.urlToImage ?? ""))
        }
    }
    func updateViewModel() {
        createViewModel()
        onSuccessfulUpdateReaction?()
    }
     func selectNewsBy(index: Int) {
        guard index < news.count else {return}
        delegate?.showInfoNews(news: news[index])
    }
}
