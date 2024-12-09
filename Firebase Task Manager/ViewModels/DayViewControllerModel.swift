//
//  DayViewControllerModel.swift
//  Firebase Task Manager
//
//  Created by Luke Frandsen on 11/13/24.
//

import FirebaseAuth
import Foundation
import SwiftUI

class DayViewControllerModel: ObservableObject {
    // Example property
    @Published var tasksForToday: [ToDoListItem] = []
    init(allTasks: [ToDoListItem] = []) {
        let today = Calendar.current.startOfDay(for: Date())
        tasksForToday = allTasks.filter { task in
            let dueDate = Date(timeIntervalSince1970: task.dueDate)
            print("Task Due Date: \(dueDate), Formatted: \(dueDate.formatted(date: .abbreviated, time: .shortened))")
            let isToday = Calendar.current.isDate(dueDate, inSameDayAs: today)
            print("Is Today: \(isToday)")
            return isToday
        }
        func updateTasks(_ allTasks: [ToDoListItem]) {
            let today = Calendar.current.startOfDay(for: Date())
            tasksForToday = allTasks.filter { task in
                let dueDate = Date(timeIntervalSince1970: task.dueDate)
                return Calendar.current.isDate(dueDate, inSameDayAs: today)
            }
            print("Filtered Tasks Updated for Today: \(tasksForToday.count)")
        }
    }
//        func fetchTasksFromFirebase() {
//            // Example of fetching tasks
//            FirebaseService.fetchTasks { [weak self] allTasks in
//                DispatchQueue.main.async {
//                    let today = Calendar.current.startOfDay(for: Date())
//                    self?.tasksForToday = allTasks.filter { task in
//                        let dueDate = Date(timeIntervalSince1970: task.dueDate)
//                        return Calendar.current.isDate(dueDate, inSameDayAs: today)
//                    }
//                }
//            }
//        }
    }
extension ToDoListItem {
    func isDueToday() -> Bool {
        let taskDate = Date(timeIntervalSince1970: self.dueDate)
        let today = Date()
        return Calendar.current.isDate(taskDate, inSameDayAs: today)
    }
}
