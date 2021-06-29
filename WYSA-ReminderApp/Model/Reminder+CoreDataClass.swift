//
//  Reminder+CoreDataClass.swift
//  WYSA-ReminderApp
//
//  Created by Chaitanya Deshpande on 28/06/21.
//
//

import Foundation
import UserNotifications
import CoreData

@objc(Reminder)
public class Reminder: NSManagedObject {
    func createReminder(title : String, note: String, time : Date) {
        let uuid : UUID = UUID()
        let reminder : Reminder = Reminder(context: PersistentContainer.shared.context)
        reminder.id = uuid
        reminder.title = title
        reminder.desc = note
        reminder.time = time
        reminder.isCompleted = false
        PersistentContainer.shared.saveContext()
        
        // Create A Notification
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = note
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        
        // Schedule Notification
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: time), repeats: false)
        let request = UNNotificationRequest(identifier: uuid.uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func getAllReminders() -> [Reminder]? {
        do {
            guard let result = try PersistentContainer.shared.context.fetch(Reminder.fetchRequest()) as? [Reminder] else {return nil}
            return result
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getReminderById(id : UUID) -> Reminder? {
        do {
            let fetchRequest = NSFetchRequest<Reminder>(entityName: "Reminder")
            let predicate = NSPredicate(format: "id=%@", id as CVarArg)
            fetchRequest.predicate = predicate
            let result = try PersistentContainer.shared.context.fetch(fetchRequest)
            return result.first
        }
        catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func updateReminder(reminder : Reminder) -> Bool {
        let result = getReminderById(id: reminder.id)
        guard result != nil else {
            return false
        }
        
        result?.title = reminder.title
        result?.desc = reminder.desc
        result?.time = reminder.time
        result?.isCompleted = reminder.isCompleted
        PersistentContainer.shared.saveContext()
        return true
    }
    
    func deleteReminder(reminder : Reminder) -> Bool {
        let result = getReminderById(id: reminder.id)
        guard result != nil else {
            return false
        }
        PersistentContainer.shared.context.delete(reminder)
        return true
    }
}
