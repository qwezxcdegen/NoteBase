//
//  CreateTaskViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit

final class CreateTaskViewController: UIViewController {

    @IBOutlet weak private var taskTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func clearTextView() {
        taskTextView.text = ""
    }
    @IBAction private func addTask() {
        guard let text = taskTextView.text, text != "" else {
            presentAlertController(title: "Error", message: "Text field is empty")
            return
        }
        guard let tabBar = tabBarController,
        let viewControllers = tabBar.viewControllers,
        let viewController = viewControllers[0] as? TasksViewController else {
            return
        }
        viewController.tasks.insert(text, at: 0)
        viewController.tableView.reloadData()
    }
    
    private func presentAlertController(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.taskTextView.text = ""
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
