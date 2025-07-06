//
//  Test+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension Test {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Test> {
        return NSFetchRequest<Test>(entityName: "Test")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var maxScore: Int16
    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var dateCreate: Date?
    @NSManaged public var questions: NSSet?
    @NSManaged public var usersTest: UsersTest?

}

// MARK: Generated accessors for questions
extension Test {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}

extension Test : Identifiable {

}
