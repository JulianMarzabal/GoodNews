//
//  APICaller.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import Foundation
import Alamofire

enum NewsError:Error {
    case notFound
    case badURL
    case badResponse
    case decodingError(Error)
}

enum RequestSettings {
    case getNews
    case searchNews(query:String)
    
    var uri:String {
        switch self {
            
        case .getNews:
            return "/v2/top-headlines?country=us&apiKey=\(apiKey)"
        case .searchNews(let query):
            return "/v2/everything?q=\(query)&apiKey=\(apiKey)"
        }
    }
    
    var apiKey:String {
        guard let apiKey = ProcessInfo.processInfo.environment["apiKey"] else {
            fatalError("Api Key not found")
        }
        return apiKey
    }
    
    var baseURL:String {
        switch self {
        default:
            return "https://newsapi.org"
        }
    }
    var fullURL: String {
           return "\(baseURL)\(uri)&apiKey=\(apiKey)"
       }
}



protocol APIProtocol{
    func getNews(completion: @escaping (Result<[News],Error>) -> Void)
    func searchNews(query:String,completion:@escaping (Result<[News],Error>) -> Void) 
    
}

class APICaller:APIProtocol {
    static let shared = APICaller()
    
    func makeBasicRequest<T:Decodable>(settings:RequestSettings, onSuccess: @escaping(T) -> Void, onError: @escaping (Error) -> Void){
        guard let url = URL(string: "\(settings.fullURL)") else {return }
        var request = AF.request(url)
        request.responseData() { response in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(T.self, from: data)
                onSuccess(response)
            } catch {
                onError(NewsError.decodingError(error))
                print("Error")
            }
        }
    }
    
    func getNews(completion: @escaping (Result<[News],Error>) -> Void) {
        makeBasicRequest(settings: .getNews, onSuccess: {(response:NewsResponse) in
            completion(.success(response.articles))}, onError: {error in
                completion(.failure(error))
            })
   
        
    }
    
    func searchNews(query:String,completion:@escaping (Result<[News],Error>) -> Void) {
        makeBasicRequest(settings: .searchNews(query: query), onSuccess: {(response:NewsResponse) in
            completion(.success(response.articles))}, onError: {error in
                completion(.failure(error))})
        
    }
}



