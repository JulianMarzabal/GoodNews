//
//  InfoViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 08/01/2023.
//

import Foundation
class InfoViewModel {
    var news: News
    private let coreData = CoreDataManager.shared
    private let storage = NewsStorage.shared
    init(news: News) {
        self.news = news
    }
    var isSelected: Bool = false {
        didSet {
        }
    }
    var onSuccessfulUpdateReaction: (() -> Void)?

    func saveNews(news: News) {
        coreData.saveNews(news: news)
    }
    func delateNews(entity: Entity) {
        isSelected = false
        coreData.deleteNews(entity: entity)
    }
    func setInitialSelectedState() {
        let object = coreData.fetchData()?.first(where: { news in
            news.title == news.title
        })
        let isTitleFirstWordEqual = object?.title?.split(separator: " ").first == news.title.split(separator: " ").first
        print(isTitleFirstWordEqual)
        print("--´-´-´-´-´-")
    }
}
