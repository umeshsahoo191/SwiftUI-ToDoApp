//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//
// hello
import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDoneO(_ state: Bool) {
        isDone = state
    }
}
