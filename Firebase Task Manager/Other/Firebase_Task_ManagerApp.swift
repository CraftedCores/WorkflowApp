//
//  Firebase_Task_ManagerApp.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import FirebaseCore
import SwiftUI

@main
struct Firebase_Task_ManagerApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
