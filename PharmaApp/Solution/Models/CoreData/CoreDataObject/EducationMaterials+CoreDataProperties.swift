//
//  EducationMaterials+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension EducationMaterials {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EducationMaterials> {
        return NSFetchRequest<EducationMaterials>(entityName: "EducationMaterials")
    }

    @NSManaged public var describe: String?
    @NSManaged public var documentPath: String?
    @NSManaged public var title: String?
    @NSManaged public var uuid: UUID?
    @NSManaged public var dateAdd: Date?
    @NSManaged public var docementType: String?

}

extension EducationMaterials : Identifiable {

}
