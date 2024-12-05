//
//  UserModel.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 5/5/24.
//

import Foundation

@MainActor

class UserModel: ObservableObject {
    @Published var id: String
    @Published var fullname: String
    @Published var email: String
    @Published var password: String
    @Published var lastPeriodStartDate: String
    @Published var averageCycleLength: Int

    // Designated initializer with all properties
    init(id: String, fullname: String, email: String, password: String, lastPeriodStartDate: String, averageCycleLength: Int)
    {
        self.id = id
        self.fullname = fullname
        self.email = email
        self.password = password
        self.lastPeriodStartDate = lastPeriodStartDate
        self.averageCycleLength = averageCycleLength
    }

   
    
    
    
}

