//
//  Events+CoreDataProperties.swift
//  HistoriX
//
//  Created by Furkan Hanci on 10/17/21.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var event: String?
    @NSManaged public var year: String?

}

extension Events : Identifiable {

}
