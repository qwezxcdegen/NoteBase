//
//  SettingsViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import UIKit
import FirebaseAuth

final class SettingsViewController: UIViewController {
    @IBOutlet weak private var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = Auth.auth().currentUser?.email
    }
    
    @IBAction private func logoutPressed() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
