//
//  LoginView.swift
//  Firebase Task Manager
//
//  Created by Chandler Johnson on 11/1/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 10, background: .pink)

                // Login Form
                Form {
                    
                    // Login Error Message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", background: .blue) {
                        // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y: -50)
                
                // Create Account
                
                VStack {
                    Text("New Around Here?")
                   
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    LoginView()
}
