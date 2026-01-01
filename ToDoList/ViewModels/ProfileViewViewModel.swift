//
//  ProfileView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import FirebaseAuth
import Foundation

class ProfileViewViewModel: ObservableObject {

    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
