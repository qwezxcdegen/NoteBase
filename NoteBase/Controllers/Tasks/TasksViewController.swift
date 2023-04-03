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
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard let currentUser = Auth.auth().currentUser else { return }
        user = User(user: currentUser)
        ref = FirebaseDatabase.Database.database().reference(withPath: "user").child(String(user.uid)).child("tasks")
    }
}
