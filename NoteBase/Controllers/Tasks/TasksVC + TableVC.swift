//
//  TasksVC + TableVC.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import Foundation
import UIKit

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        return cell
    }
    
    
}
