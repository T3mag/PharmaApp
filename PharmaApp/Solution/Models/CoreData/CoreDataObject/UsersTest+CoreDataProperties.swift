//
//  UsersTest+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension UsersTest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsersTest> {
        return NSFetchRequest<UsersTest>(entityName: "UsersTest")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var userScore: Double
    @NSManaged public var feedback: String?
    @NSManaged public var test: Test?
    @NSManaged public var user: User?

}

extension UsersTest : Identifiable {

}
