//
//  ViewController.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 02.04.2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    // MARK: - IBOutlets
    
    // Textfields
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    // Buttons
    @IBOutlet weak private var loginButton: UIButton!
    @IBOutlet weak private var registerButton: UIButton!
    
    // MARK: - Properties
    var ref: FirebaseDatabase.DatabaseReference!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FirebaseDatabase.Database.database().reference(withPath: "users")
        Auth.auth().addStateDidChangeListener { auth, user in
            guard user != nil else { return }
            self.performSegue(withIdentifier: "enteredSegue", sender: nil)
        }
    }
    
    // MARK: - Override methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    // Login button
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
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                return
            }
            guard error == nil else {
                self.presentAlertController(title: "Error", message: "User does not exist")
                return
            }
            self.presentAlertController(title: "Error", message: "Error occured")
            return
        }
    }
    // Register button
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
                let userRef = self.ref.child((user?.user.uid)!)
                userRef.setValue(["email": user?.user.email])
                return
            }
            guard error == nil else {
                self.presentAlertController(title: "Error", message: "User does exist")
                return
            }
        }
    }
    
    // MARK: - Methods
    
    // present UIAlertController
    private func presentAlertController(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

