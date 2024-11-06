//
//  ToDoListItemsView.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        // users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            
                            .tint(.red)
                        }
                        .listStyle(PlainListStyle())
                }
                .navigationTitle("To-Do List")
                .toolbar {
                    Button {
                        // Action
                        viewModel.showingNewItemView = true
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    
    #Preview {
        ToDoListView(userId: "WJaMmBIonVRfRMdXx3rD6k5cYDD2")
    }
}
