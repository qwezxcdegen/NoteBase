//
//  OfflineTasksVC + TableVC.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit

extension OfflineTasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        offlineTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = offlineTasksTV.dequeueReusableCell(withIdentifier: "offlineTaskCell", for: indexPath) as? OfflineTaskTableViewCell else {
            return UITableViewCell()
        }
        toggleCompletion(cell, isCompleted: offlineTasks[indexPath.row].completed)
        cell.offlineTaskLabel.text = offlineTasks[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            offlineTasks.remove(at: indexPath.row)
            offlineTasksTV.deleteRows(at: [indexPath], with: .fade)
            saveTasks()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        offlineTasks[indexPath.row].completed.toggle()
        saveTasks()
        offlineTasksTV.reloadData()
    }
    
    private func toggleCompletion(_ cell: UITableViewCell, isCompleted: Bool) {
        cell.accessoryType = isCompleted ? .checkmark : .none
    }
}
