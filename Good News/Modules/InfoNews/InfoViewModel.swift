//
//  InfoViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 08/01/2023.
//

import Foundation


class InfoViewModel {
    var news:News
    private let coreData = CoreDataManager.shared
    init(news: News) {
        self.news = news
    
    }
    private (set) var newsSelected: [News] = NewsStorage.shared.news {
        didSet{
            NewsStorage.shared.news = newsSelected
            
        }
    }
    var onSuccessfulUpdateReaction:  (() -> Void)?
    var isSelectect:Bool = false
    
    
    func saveNews(news:News) {
        coreData.SaveNews(news: news)
        print("Se ejecuto este codigo")
        isSelectect = true
        
    }
    func delateNews(entity:Entity){
        coreData.deleteNews(entity: entity)
    }
    
}
