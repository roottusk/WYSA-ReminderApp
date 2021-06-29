//
//  reminderCell.swift
//  WYSA-ReminderApp
//
//  Created by Chaitanya Deshpande on 28/06/21.
//

import UIKit

class ReminderCell: UITableViewCell {

    @IBOutlet weak var reminderDesc: UILabel!
    @IBOutlet weak var reminderTime: UILabel!
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setReminderView(reminder: Reminder) {
        self.reminderTitle.text = reminder.title
        self.reminderDesc.text = reminder.desc
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"

        let myString = formatter.string(from: reminder.time!)
        self.reminderTime.text = myString
        
        if reminder.time! < Date() {
            self.reminderTime.textColor = UIColor.red
        }
        else {
            self.reminderTime.textColor = UIColor.darkGray
        }
    }
    
}
