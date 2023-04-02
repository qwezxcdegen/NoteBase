//
//  ViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 02.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var emailTextField: UITextField!
    
    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var warningLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segue = segue.destination as? UITabBarController else { return }
        guard let vc = segue as? UIViewController else { return }
    }
    
    @IBAction private func loginPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "", password != "" else {
            presentAlertController(title: "Error", message: "Enter correct data")
            return
        }
    }
    
    
    @IBAction private func registerPressed() {
    }
    
    
    private func presentWarning(with text: String) {
        warningLabel.textColor = .systemRed
        warningLabel.text = text
        warningLabel.isHidden = false
    }
    
    private func presentAlertController(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

