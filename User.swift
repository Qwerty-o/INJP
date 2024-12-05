//
//  User.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 1/29/24.
//

import Foundation

//needs this file for any app with user authentication

//this is where u add edit user info(eg. phone number)
struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let password: String
    var lastPeriodStartDate: String
    var averageCycleLength: Int

    
    var initials: String {
        // will look at fullname, and then divide it
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
         return " "
    }
}

extension User {
    static var mock_user = User(id:NSUUID().uuidString, fullname: "Sejal Ghanate", email: "user@gmail.com", password: "Password123!", lastPeriodStartDate: "2023-05-20", averageCycleLength: 5)
}

extension NSDate
{
    convenience
      init(dateString:String) {
          let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
          dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
          let d = dateStringFormatter.date(from: dateString)!
          self.init(timeInterval:0, since:d)
    }
 }
