//
//  Achievment+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension Achievment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Achievment> {
        return NSFetchRequest<Achievment>(entityName: "Achievment")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var describe: String?

}

extension Achievment : Identifiable {

}
