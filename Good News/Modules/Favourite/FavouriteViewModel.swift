//
//  FavouriteNewsCellViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//

import Foundation

class FavouriteViewModel {
    var newsFavourite: [Entity] = []
    
    let coreData = CoreDataManager.shared
    
    func showFavouriteNews() {
        newsFavourite =  coreData.fetchData() ?? []
        createTableViewCellModel()
    }
    
    func createTableViewCellModel() {
        for i in newsFavourite {
            var model = FavouriteNewsTableViewModel.init(title: i.title ?? "News not found", description: i.description)
            print(model.title)
        }
        
    }
    
    func eliminateFavouriteNews(entity: Entity) {
        coreData.deleteNews(entity: entity)
        if let index = newsFavourite.firstIndex(where: { $0 == entity }) {
                    newsFavourite.remove(at: index)
                }
    }
    
}
