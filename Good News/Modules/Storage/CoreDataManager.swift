//
//  CoreDataManager.swift
//  Good News
//
//  Created by Julian Marzabal on 11/10/2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let context: NSManagedObjectContext
       
       private init() {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               fatalError("Cannot acces to AppDelegate")
           }
           context = appDelegate.persistentContainer.viewContext
       }
    
    func fetchData() -> [Entity]? {
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()

        do {
            let newsEntities = try context.fetch(fetchRequest)
            print("fetch data do")
            return newsEntities
           
        } catch {
            print("Error al recuperar datos de Core Data: \(error)")
            return nil
        }
    }
    func SaveNews(news:News) {
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", news.title)
        
        do {
            let existingNewsEntities = try context.fetch(fetchRequest)
          
            if let existingEntity = existingNewsEntities.first {
                return
            }
        } catch {
            print("Error trying to get news: \(error)")
        }
        let newEntity = Entity(context: context)
        newEntity.title = news.title
        newEntity.text = news.description
        
        do {
            try context.save()
        } catch {
            print("Error")
        }
    }
    
    func deleteNews(entity: Entity) {
            context.delete(entity)
            
            do {
                try context.save()
            } catch {
                print("Error trying to elminate core data  \(error)")
            }
        }
    
    
  
    
    
}