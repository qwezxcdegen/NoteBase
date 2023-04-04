//
//  OfflineTasksVC + AlertController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import Foundation
import UIKit

extension OfflineTasksViewController {
    func addTask() {
        let ac = UIAlertController(title: "New task", message: "Enter your task", preferredStyle: .alert)
        ac.addTextField()
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let tf = ac.textFields?.first,
                  let text = tf.text,
            text != "" else { return }
            self.offlineTasks.insert(OfflineTask(title: text), at: 0)
            self.offlineTasksTV.reloadData()
            self.saveTasks()
            print(self.offlineTasks)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        ac.addAction(cancelAction)
        ac.addAction(addAction)
        present(ac, animated: true)
    }
    
    func saveTasks() {
        UserDefaults.standard.set(self.offlineTasks.map { $0.title }, forKey: "titles")
        UserDefaults.standard.set(self.offlineTasks.map { $0.completed }, forKey: "status")
    }
}
