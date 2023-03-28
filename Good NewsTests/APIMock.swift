//
//  APIMock.swift
//  Good NewsTests
//
//  Created by Julian Marzabal on 27/03/2023.
//

import Foundation
@testable import Good_News

class ApiMock:APIProtocol {
    var newsResponse: Result<[News],Error>?
    func getNews(completion: @escaping (Result<[News], Error>) -> Void) {
        if let newsResponse = newsResponse {
            completion(newsResponse)
        }
    }
    

}
