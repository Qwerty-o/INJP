//
//  PeriodTracking.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 5/10/24.
//

import Foundation

class PeriodTracker: ObservableObject {
    @Published var periodDays: [Date] {
        didSet {
            savePeriodDays()
        }
    }

    init() {
        self.periodDays = UserDefaults.standard.object(forKey: "periodDays") as? [Date] ?? []
    }

    private func savePeriodDays() {
        UserDefaults.standard.set(periodDays, forKey: "periodDays")
    }
}
