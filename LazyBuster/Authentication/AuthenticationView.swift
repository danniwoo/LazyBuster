//
//  AuthenticationView.swift
//  My first App
//
//  Created by Daniel on 16/01/2025.
//

import SwiftUI

struct AuthenticationView: View {
    
    private func signInWithGoogle() {
        //      Task {
        //        if await viewModel.signInWithGoogle() == true {
        //          dismiss()
        //        }
        //      }
    }
    
    var body: some View {
        VStack{
            
            NavigationLink{
                SignInEmailView()
            } label: {
                Text("Sign in here")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer() // space
            
            
            
            Button(action: signInWithGoogle) {
                Text("Sign in with Google")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(alignment: .leading) {
                        Image("Google")
                            .frame(width: 30, alignment: .center)
                    }
            }
            .buttonStyle(.bordered)
            
            
            
        }
        .padding()
        .navigationTitle("Sign in")
    }
}
 
#Preview {
    NavigationStack{
        AuthenticationView()
    }
}
