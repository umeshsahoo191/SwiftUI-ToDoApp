//
//  RegisterView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModal = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtittle: "Start organizing your tasks", angle: -15, background: .orange)
            Form{
                TextField("Full Name",text: $viewModal.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address",text: $viewModal.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password",text: $viewModal.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "create account",background: .green)
                {
                    // attempt registration
                }
                
            }.offset(y:-50)
            
            Spacer()
        }
    }
}
#Preview {
    RegisterView()
}
