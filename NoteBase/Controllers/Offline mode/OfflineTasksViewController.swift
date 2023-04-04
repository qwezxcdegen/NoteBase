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
        getTasks()
    }
    
    @IBAction func addOfflineTaskPressed(_ sender: UIBarButtonItem) {
        addTask()
    }
    
    @IBAction func onlineButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getTasks() {
        guard let titles = UserDefaults.standard.object(forKey: "titles") as? [String] else { return }
        guard let statuses = UserDefaults.standard.object(forKey: "status") as? [Bool] else { return }
        for i in 0..<titles.count {
            offlineTasks.append(OfflineTask(title: titles[i], completed: statuses[i]))
        }
    }
}
