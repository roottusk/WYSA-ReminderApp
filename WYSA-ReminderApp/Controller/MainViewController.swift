//
//  ViewController.swift
//  WYSA-ReminderApp
//
//  Created by Chaitanya Deshpande on 28/06/21.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reminderTableView: UITableView!
    @IBOutlet weak var createReminderButton: UIButton!
    @IBOutlet weak var noRemindersView: UIView!
    var reminderList : [Reminder]?
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
    }

    func setupUI() {
        loadReminderList()
        self.noRemindersView.isHidden = true
        self.reminderTableView.isHidden = false
        self.createReminderButton.layer.cornerRadius = 12
        if reminderList?.count == 0 {
            self.noRemindersView.isHidden = false
            self.reminderTableView.isHidden = true
        }
        else {
            self.noRemindersView.isHidden = true
            self.reminderTableView.isHidden = false
        }
        tableView.register(UINib(nibName: "ReminderCell", bundle: nil), forCellReuseIdentifier: "ReminderCell")
    }
    
    func loadReminderList() {
        let remiderInterface : Reminder = Reminder()
        reminderList = remiderInterface.getAllReminders()
        tableView.reloadData()
    }
}

extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create Custom Cell for TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as? ReminderCell
        // Get Vehicle At IndexPath
        let reminder : Reminder = reminderList![indexPath.row]
        // SetUp View
        cell?.setReminderView(reminder: reminder)
        return cell!
    }
}

