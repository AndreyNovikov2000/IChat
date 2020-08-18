//
//  Validator.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

class Validator {
    
    static func isField(withEmail email: String?, password: String?, confirmPassword: String?) -> Bool {
        guard let password = password,
            let confirmPassword = confirmPassword,
            let email = email,
            password != "",
            confirmPassword != "",
            email != ""
           else {
                return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64"
        return checkPredicate(text: email, regEx: emailRegEx)
    }
    
    private static func checkPredicate(text: String, regEx: String) -> Bool {
//        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: text)
        return true
    }
}
