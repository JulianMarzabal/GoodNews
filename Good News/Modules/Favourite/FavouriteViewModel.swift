//
//  FavouriteNewsCellViewModel.swift
//  Good News
//
//  Created by Julian Marzabal on 10/10/2023.
//

import Foundation

class FavouriteViewModel {
    public var newsFavourite: [Entity] = []
    let coreData = CoreDataManager.shared
    func showFavouriteNews() {
        newsFavourite =  coreData.fetchData() ?? []
        createTableViewCellModel()
    }
    func createTableViewCellModel() {
        for news in newsFavourite {
            var model = FavouriteNewsTableViewModel.init(title: news.title ?? "News not found", description: news.description)
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
