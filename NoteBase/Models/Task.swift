//
//  Task.swift
//  NoteBase
//
//  Created by Степан Фоминцев on 03.04.2023.
//

import Foundation
import FirebaseDatabase
import Firebase

struct Task {
    let title: String
    let userID: String
    let ref: FirebaseDatabase.DatabaseReference?
    var completed = false
    
    init(title: String, userID: String) {
        self.title = title
        self.userID = userID
        self.ref = nil
    }
    
    init(snapshot: FirebaseDatabase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userID = snapshotValue["userID"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
}
