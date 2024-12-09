//
//  DayViewControllerView.swift
//  Firebase Task Manager
//
//  Created by Luke Frandsen on 11/13/24.
//

//
import SwiftUI

struct DayViewControllerView: View {
    @StateObject var viewModel = DayViewControllerModel()

    var body: some View {
        VStack {
            Text("Tasks for Today")
                .font(.headline)
                .padding()

            if viewModel.tasksForToday.isEmpty {
                Text("No tasks for today!")
                    .foregroundColor(.gray)
                    .italic()
               
            } else {
                List(viewModel.tasksForToday) { task in
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .font(.body)
                        
                        Text(Date(timeIntervalSince1970: task.dueDate)
                                .formatted(date: .abbreviated, time: .shortened))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }

                    
                        }
                    }
            }
        
        }
#Preview {
    DayViewControllerView()
}
