//
//  NewsViewDelegateMock.swift
//  Good NewsTests
//
//  Created by Julian Marzabal on 27/03/2023.
//
@testable import Good_News
import Foundation

class NewsViewDelegateMock: NewsViewDelegate {
    var onShowInfoNews = false
    var receivedNews: News?
    func showInfoNews(news: News) {
        onShowInfoNews = true
        receivedNews = news
    }
    
    
}
