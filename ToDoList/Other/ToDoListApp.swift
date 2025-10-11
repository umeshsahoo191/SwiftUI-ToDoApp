//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
