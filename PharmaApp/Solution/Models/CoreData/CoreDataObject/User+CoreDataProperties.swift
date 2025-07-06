//
//  User+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var profilePhotoPath: String?
    @NSManaged public var dateJoined: Date?
    @NSManaged public var usersTests: NSSet?

}

// MARK: Generated accessors for usersTests
extension User {

    @objc(addUsersTestsObject:)
    @NSManaged public func addToUsersTests(_ value: UsersTest)

    @objc(removeUsersTestsObject:)
    @NSManaged public func removeFromUsersTests(_ value: UsersTest)

    @objc(addUsersTests:)
    @NSManaged public func addToUsersTests(_ values: NSSet)

    @objc(removeUsersTests:)
    @NSManaged public func removeFromUsersTests(_ values: NSSet)

}

extension User : Identifiable {

}
