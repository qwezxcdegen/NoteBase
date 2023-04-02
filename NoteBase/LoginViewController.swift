//
//  ViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 02.04.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak private var emailTextField: UITextField!
    
    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var loginButton: UIButton!
    
    @IBOutlet weak private var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction private func loginPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "", password != "" else {
            presentAlertController(title: "Error", message: "Enter correct data")
            return
        }
        guard password.count > 5 else {
            presentAlertController(title: "Error", message: "The password must have at least 6 characters")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            guard user == nil else {
                self.performSegue(withIdentifier: "enteredSegue", sender: nil)
                return
            }
            guard error != nil else {
                self.presentAlertController(title: "Error", message: "User does not exist")
                return
            }
        }
    }
    
    
    @IBAction private func registerPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              email != "", password != "" else {
            presentAlertController(title: "Error", message: "Enter correct data to register")
            return
        }
        guard password.count > 5 else {
            presentAlertController(title: "Error", message: "The password must have at least 6 characters")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            guard user == nil else {
                self.presentAlertController(title: "OK", message: "Successfully registered")
                return
            }
            guard error == nil else {
                self.presentAlertController(title: "Error", message: "User does exist")
                return
            }
        }
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

