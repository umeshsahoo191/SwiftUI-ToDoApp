   //
//  ContentView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModal = MainViewViewModel()
    
    var body: some View {
         if viewModal.isSignedIn, !viewModal.currentUserId.isEmpty {
           accountView
        }
        else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModal.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
               ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            }
    }
}

struct ContentView: PreviewProvider{
   static var previews: some View {
        MainView()
    }
}
