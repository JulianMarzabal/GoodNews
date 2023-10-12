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
    private let storage = NewsStorage.shared
    init(news: News) {
        self.news = news
        
    
    }
    
    var isSelected: Bool = false {
        didSet {
            storage.isSelected = isSelected
        }
    }
    
    
    var onSuccessfulUpdateReaction:  (() -> Void)?
    
    
    
    func saveNews(news:News) {
        
        coreData.SaveNews(news: news)
        print("Se ejecuto este codigo")
        
        
    }
    func delateNews(entity:Entity){
        isSelected = false
        coreData.deleteNews(entity: entity)
        
    }
    
}
