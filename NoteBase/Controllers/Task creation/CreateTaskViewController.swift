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
        presentAlertController(title: "Success", message: "Task created")
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
