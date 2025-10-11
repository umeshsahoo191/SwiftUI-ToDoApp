//
//  RegisterView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtittle: "Start organizing your tasks", angle: -15, background: .orange)
            Form{
                TextField("Full Name",text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address",text: $email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Password",text: $password)
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
