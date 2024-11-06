//
//  ToDoListViewViewModel.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import FirebaseFirestore
import Foundation

// ViewModel for a single To-Do list item (Each row in items list)
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    // Delete items on to-do list
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
            
    }
}
