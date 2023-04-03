//
//  CreateTaskViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit
import FirebaseDatabase

final class CreateTaskViewController: UIViewController {

    @IBOutlet weak private var taskTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        hideKeyboard()
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
        let task = Task(title: text, userID: viewController.user.uid)
        let taskRef = viewController.ref.child(task.title.lowercased())
        taskRef.setValue(["title": task.title, "userID": task.userID, "completed": task.completed])
        presentAlertController(title: "OK", message: "Task added")
    }
    
    private func presentAlertController(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.taskTextView.text = ""
            self.hideKeyboard()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
