//
//  ToDoListItemViewViewModel.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for list of items view
// Primary Tab
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())

        
    }
}
