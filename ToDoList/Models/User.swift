//
//  User.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
