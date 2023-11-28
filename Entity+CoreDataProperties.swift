//
//  Entity+CoreDataProperties.swift
//  
//
//  Created by Julian Marzabal on 11/10/2023.
//
//

import Foundation
import CoreData

extension Entity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }
    @NSManaged public var title: String?
    @NSManaged public var text: String?

}
