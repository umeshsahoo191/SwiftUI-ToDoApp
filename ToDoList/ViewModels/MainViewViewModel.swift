   //
//  ContentView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import SwiftUI

struct MainViewViewModel: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    MainViewViewModel()
}
