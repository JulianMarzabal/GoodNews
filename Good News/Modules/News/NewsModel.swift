//
//  NewsModel.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import Foundation
struct NewsResponse: Decodable {
    let articles: [News]
}

struct News: Decodable {
    let id: Int?
    let title: String
    let description: String?
    let urlToImage: String?
    let content: String?
}
