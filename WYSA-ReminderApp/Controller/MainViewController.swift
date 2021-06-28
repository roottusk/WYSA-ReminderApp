//
//  ViewController.swift
//  WYSA-ReminderApp
//
//  Created by Chaitanya Deshpande on 28/06/21.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var reminderTableView: UITableView!
    @IBOutlet weak var createReminderButton: UIButton!
    @IBOutlet weak var noRemindersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        self.noRemindersView.isHidden = true
        self.reminderTableView.isHidden = false
        self.createReminderButton.layer.cornerRadius = 12
        if true {
            self.noRemindersView.isHidden = false
            self.reminderTableView.isHidden = true
        }
    }
    
}

