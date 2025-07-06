//
//  Question+CoreDataProperties.swift
//  PharmaApp
//
//  Created by Артур Миннушин on 19.06.2025.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var uuid: UUID?
    @NSManaged public var question: String?
    @NSManaged public var timeForAnswerInSecond: Int16
    @NSManaged public var answers: NSSet?
    @NSManaged public var test: Test?

}

// MARK: Generated accessors for answers
extension Question {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: Answer)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: Answer)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}

extension Question : Identifiable {

}
