//
//  User.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import Foundation
import Firebase

struct User {
    let uid: String
    let email: String
    
    init(user: FirebaseAuth.User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
