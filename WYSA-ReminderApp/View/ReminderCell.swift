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
    
}
