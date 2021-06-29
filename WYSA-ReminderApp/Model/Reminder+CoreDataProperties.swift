//
//  Reminder+CoreDataProperties.swift
//  WYSA-ReminderApp
//
//  Created by Chaitanya Deshpande on 28/06/21.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: UUID
    @NSManaged public var isCompleted: Bool
    @NSManaged public var time: Date?
    @NSManaged public var title: String?

}

extension Reminder : Identifiable {

}
