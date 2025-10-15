//
//  LoginView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    
    func login(){
        guard validate() else { return }
        print("Login Called")
        //try login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
         errorMessage = "Please enter email and password"
            
            return false
        }
        // email@goo.com/
        guard email.contains("@") && email.contains(".") else
        {
            errorMessage = "Please enter valid email"
            return false
        }
        print("Called")
        
        return true
    }
}

