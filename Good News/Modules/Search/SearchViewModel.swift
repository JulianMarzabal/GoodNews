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
   
    var onSuccessfullUpdateReaction:  (() -> Void)?
    public var text: String = ""{
        didSet{
            self.searchItemResult()
        }
    }
    
   
    
    
    
    func searchItemResult(){
        
       
        
    }
 
    func updateViewModel() {
       
        onSuccessfullUpdateReaction?()
    }
    
    
    
    
    
    
    
    
}
