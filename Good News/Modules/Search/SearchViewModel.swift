//
//  SearchViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 12/10/2023.
//

import Foundation
import Foundation
protocol SearchViewDelegate:AnyObject {
    func toDescription()
}

class SearchResultViewModel{
    
    var api:APIProtocol = APICaller.shared
    weak var delegate: SearchViewDelegate?
    var news:[News] = [News]()
    var searchModel:[SearchModel] = []
   
    var onSuccessfullUpdateReaction:  (() -> Void)?
    public var text: String = ""{
        didSet{
            self.searchItemResult()
        }
    }
    
   
    
    
    
    func searchItemResult(){
        guard !text.isEmpty else {return}
        api.searchNews(query: text) { [weak self] results in
            switch results {
            case .success(let searchNews):
                self?.news = searchNews
                self?.createModel()
                self?.onSuccessfullUpdateReaction?()
                
            case .failure(let error):
                print(error)
            }
        }
    }
 
    func updateViewModel() {
       createModel()
        onSuccessfullUpdateReaction?()
    }
    
    func createModel() {
        searchModel = []
        for i in news {
            searchModel.append(.init(title: i.title, description: i.description, content: i.content, image: i.urlToImage ?? ""))
        
        }
       
    }
    
    
    
    
    
    
    
    
}
