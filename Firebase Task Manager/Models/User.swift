//
//  User.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
