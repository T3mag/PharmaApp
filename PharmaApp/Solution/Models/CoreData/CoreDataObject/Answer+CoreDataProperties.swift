//
//  Answer+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var title: String?
    @NSManaged public var isRight: Bool
    @NSManaged public var question: Question?

}

extension Answer : Identifiable {

}
