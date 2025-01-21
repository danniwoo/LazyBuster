//
//  AuthenticationMananger.swift
//  My first App
//
//  Created by Daniel on 16/01/2025.
//

import Foundation
import FirebaseAuth

struct AutAuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}


final class AuthenticationMananger {
    
    static let shared = AuthenticationMananger()
    
    private init() { }
    
    func createUser(email: String, password: String) async throws -> AutAuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AutAuthDataResultModel(user: authDataResult.user) // new user
        
    }
}
