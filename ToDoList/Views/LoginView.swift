//
//  LoginView.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 13/08/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(title: "ToDo List", subtittle: "Get things done", angle: 15, background: .pink)
                // Login Form
                Form {
                    TextField("Email", text: $viewModel.email
                    )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TLButton(title: "Login",background: .blue)
                    {
                        //attempt login
                    }
                }
                //create Account
                VStack{
                    Text("New Around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                    }
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }

#Preview {
    LoginView()
}
