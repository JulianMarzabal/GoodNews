//
//  APICaller.swift
//  Good News
//
//  Created by Julian Marzabal on 09/10/2022.
//

import Foundation
import Alamofire


struct Constants {
    static let APIKey = "700f2779a1fe4850b73f96253534617f"
    static let BaseUrl = "https://newsapi.org"
}
protocol APIProtocol{
    func getNews(completion: @escaping (Result<[News],Error>) -> Void)
    func searchNews(query:String,completion:@escaping (Result<[News],Error>) -> Void) 
    
}

class APICaller:APIProtocol {
    static let shared = APICaller()
    
    func getNews(completion: @escaping (Result<[News],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.BaseUrl)/v2/top-headlines?country=us&apiKey=\(Constants.APIKey)") else {return}
        
        
        let request = AF.request(url)
        request.responseData() { response in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles))
                print("status 200")
                
            }
            catch{
                completion(.failure(error))
            }
            
        
            
        }
                
        
        
        
    }
    
    func searchNews(query:String,completion:@escaping (Result<[News],Error>) -> Void) {
       guard let url = URL(string: "\(Constants.BaseUrl)/v2/everything?q=\(query)&apiKey=\(Constants.APIKey)") else {return}
        let request = AF.request(url)
        request.responseData { response in
            guard let data = response.data else {
                return
            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles))
                
                print("Search News")
            } catch {
                completion(.failure(error))
            }
        }
        
    }
}



