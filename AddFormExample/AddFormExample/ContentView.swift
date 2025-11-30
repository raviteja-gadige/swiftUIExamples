//
//  ContentView.swift
//  AddFormExample
//
//  Created by Apple on 30/11/25.
//

import SwiftUI

// Forms are a great way to collect data from users in a structured manner. They offer a variety of input controls and can be easily customized to match your app’s visual style. In this cookbook entry, you’ll learn how to create a form in SwiftUI and how to add different input controls to it.

struct ContentView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                Section(header: Text("Login Credentials"))  {
                    SecureField("Password", text: $password)
                }
                Section {
                    Button(action: register) {
                        Text("Register")
                    }
                }
            }
        }
        .navigationTitle("Registration Form")
    }
    
    func register() {
        // Implement registration functionality here
    }
}

#Preview {
    ContentView()
}
