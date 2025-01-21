//
//  SignInEmailView.swift
//  My first App
//
//  Created by Daniel on 16/01/2025.
//

import SwiftUI

@MainActor // swift concurrency
final class SinfInEmailViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var Password = ""
    
    func signIn()  { // not async throws??
        guard !email.isEmpty, !Password.isEmpty else {
            print("no email or pawword found")
            return
        }
        
        
        Task{
            do {
                let returnedUserData = try await AuthenticationMananger.shared.createUser(email: email, password: Password)
                print("success")
                print(returnedUserData)
            } catch {
                print("error: \(error)")
            }
        }
        
    }
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SinfInEmailViewModel()
    
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(8)
            
            SecureField("Password...", text: $viewModel.Password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(8)
            
            Button{
                //action
                viewModel.signIn()
            } label: {
                Text("Sign in here")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Sign in with Email")
    }
}

#Preview {
    SignInEmailView()
}
