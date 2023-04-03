//
//  OfflineTasksViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit
import CoreData

class OfflineTasksViewController: UIViewController {

    
    @IBOutlet weak var offlineTasksTV: UITableView!
    
    
    var offlineTasks: [OfflineTask] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineTasksTV.delegate = self
        offlineTasksTV.dataSource = self
    }
    
    @IBAction func addOfflineTaskPressed(_ sender: UIBarButtonItem) {
        addTask()
    }
    
    @IBAction func onlineButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
