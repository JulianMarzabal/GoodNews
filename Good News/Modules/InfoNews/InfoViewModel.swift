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
    
    func updateNews(title: String, isSelected: Bool){
        isSelected ? newsSelection(title: title) : removeNewsSelection(title: title)
        print("updateNewsss   \(isSelected) \(newsSelected.count)")
        
        
    }
  /*  private func newsSelection(title: String) {
        if newsSelected.first(where: { $0.title == title }) == nil {
            if let selectedNews = NewsStorage.shared.news.first(where: { $0.title == title }) {
                newsSelected.append(selectedNews)
            }
        }
        
    }*/
    private func newsSelection(title: String) {
        if let selectedNewsIndex = newsSelected.firstIndex(where: { $0.title == title }) {
            // Si la noticia ya está en newsSelected, quitarla (deselección)
            newsSelected.remove(at: selectedNewsIndex)
        } else {
            // Si la noticia no está en newsSelected, añadirla (selección)
            if let selectedNews = NewsStorage.shared.news.first(where: { $0.title == title }) {
                newsSelected.append(selectedNews)
            }
        }
        
        print("newsSelected count: \(newsSelected.count)")
    }
    
    private func removeNewsSelection(title: String){
        if let index = newsSelected.firstIndex(where: {
            $0.title == title
        }) {
            newsSelected.remove(at: index)
        }
    }
    
    func saveNews(news:News) {
        coreData.SaveNews(news: news)
        print("Se ejecuto este codigo")
    }
    
    
}
