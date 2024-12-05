//
//  Validate.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/2/24.
//

import Foundation

enum Validator {
    static func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#

        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    static func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"

        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    static func validateFullName(_ fullname: String) -> Bool {
        //TODO fix this
        return !fullname.isEmpty
    }
    
    static func validateConfirmPassword(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}
