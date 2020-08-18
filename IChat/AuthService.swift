//
//  AuthService.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    func logIn(withEmail email: String?, password: String?, response:@escaping (Result<User, Error>) -> Void) {
        guard let email = email, let password = password else {
            response(.failure(AuthError.notField))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Error - \(error.localizedDescription)")
                response(.failure(error))
                return
            }
            
            guard let result = result else { return }
            response(.success(result.user))
        }
    }
    
    func createUser(withEmail email: String?, password: String?, confirmPassword: String?, response:@escaping (Result<User, Error>) -> Void) {
        guard Validator.isField(withEmail: email, password: password, confirmPassword: confirmPassword) else {
            response(.failure(AuthError.notField))
            return
        }
        
        guard password!.lowercased() == confirmPassword!.lowercased() else {
            response(.failure(AuthError.passwordNotMatched))
            return
        }
        
        guard Validator.isSimpleEmail(email!) else {
            response(.failure(AuthError.invaliadeEmail))
            return
        }
        
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            if let error = error {
                print("Error - \(error.localizedDescription)")
                response(.failure(error))
                return
            }
            
            guard let result = result else {
                response(.failure(AuthError.unknownError))
                return
            }
            
            response(.success(result.user))
        }
    }
}
