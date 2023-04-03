//
//  TasksViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

final class TasksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    var ref: FirebaseDatabase.DatabaseReference!
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = FirebaseDatabase.Database.database().reference(withPath: "users").child(String(user.uid)).child("tasks")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.observe(.value) { snapshot in
            var _tasks: [Task] = []
            for item in snapshot.children {
                let task = Task(snapshot: item as! FirebaseDatabase.DataSnapshot)
                _tasks.insert(task, at: 0)
            }
            self.tasks = _tasks
            self.tableView.reloadData()
        }
    }
}
