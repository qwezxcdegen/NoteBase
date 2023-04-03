//
//  TasksViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit

final class TasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}
