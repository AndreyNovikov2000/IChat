//
//  AuthError.swift
//  IChat
//
//  Created by Andrey Novikov on 8/17/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

enum AuthError {
    case notField
    case invaliadeEmail
    case passwordNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notField:
            return NSLocalizedString("Feild all text fields", comment: "")
        case .invaliadeEmail:
             return NSLocalizedString("Email is invalidate", comment: "")
        case .passwordNotMatched:
             return NSLocalizedString("Different paswords", comment: "")
        case .unknownError:
             return NSLocalizedString("Unknown error", comment: "")
        case .serverError:
             return NSLocalizedString("Server error", comment: "")
        }
    }
}
