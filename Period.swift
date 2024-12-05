//
//  Period.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 5/8/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


// Create a dictionary to store the data for each user.
var userData = [String: [Period]]()

// Get a reference to the FirebaseFirestore database.
let db = Firestore.firestore()

// Create a query to get all the period data from the database.
let query = db.collection("periods").whereField("userId", isEqualTo: "USER_ID")

// Get the documents from the query.
func getPeriods(query: Query) {
    query.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error getting documents: \(error)")
        } else {
            // Iterate over the documents and add each period to the appropriate array in the dictionary.
            for document in querySnapshot!.documents {
                if let startDate = document.get("startDate") as? Timestamp,
                   let endDate = document.get("endDate") as? Timestamp {
                    let period = Period(startDate: startDate.dateValue(), endDate: endDate.dateValue())
                }
            }
            
            
            // Calculate the average cycle length and period length for each user.
            for (userId, periods) in userData {
                var totalCycleLength: Double = 0
                var numberOfCycles: Int = 0
                var totalPeriodLength: Double = 0
                var numberOfPeriods: Int = 0
                
                for period in periods {
                    totalCycleLength += Double(period.length)
                    numberOfCycles += 1
                    totalPeriodLength += Double(period.length)
                    numberOfPeriods += 1
                }
                
                let averageCycleLength = totalCycleLength / Double(numberOfCycles)
                let periodLength = totalPeriodLength / Double(numberOfPeriods)
                
                // Store the average cycle length and period length for each user in a database or other persistent storage.
            }
        }
    }
}

class Period {
    let startDate: Date
    let endDate: Date
    let length: Int

    init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
        self.length = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day! + 1
    }
}
