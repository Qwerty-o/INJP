//
//  PeriodPrediction.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 5/9/24.
//

import Foundation

import FirebaseFirestore
//@EnvironmentObject var user: UserModel

func predictNextPeriodDate(userId: String) async throws -> Date {
    let db = Firestore.firestore()
    let userDocument = db.collection("users").document(userId)

    let userData = try await userDocument.getDocument()
    guard let data = userData.data(),
          let lastPeriodStartDate = data["lastPeriodStartDate"] as? Timestamp,
          let averageCycleLength = data["averageCycleLength"] as? Int else {
        throw NSError(domain: "DataError", code: 1002, userInfo: [NSLocalizedDescriptionKey: "Invalid or incomplete user data"])
    }

    let lastPeriodDate = lastPeriodStartDate.dateValue()
    let calendar = Calendar.current
    let nextPeriodDate = calendar.date(byAdding: .day, value: averageCycleLength, to: lastPeriodDate)!

    return nextPeriodDate
}
