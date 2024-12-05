//
//  AppEnums.swift
//  ItsNotJustaPhase
//
//  Created by Sejal Ghanate on 2/16/24.
//

import Foundation

struct CustomMood: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String? // Optional field for additional details
}

enum CustomMoodError: Error {
    case emptyName
    // Add other error cases as needed
}

enum CustomMoodEnum {
    case custom(CustomMood)
}

func createCustomMood(name: String, description: String? = nil) throws -> CustomMood {
    guard !name.isEmpty else {
        throw CustomMoodError.emptyName
    }
    // Add other validation checks if needed
    return CustomMood(name: name, description: description)
}

enum MoodEnum: String, RawRepresentable {
    case happy, sad, anxious
    // ... other moods

    init?(rawValue: String) {
        switch rawValue {
        case "happy": self = .happy
        case "sad": self = .sad
        case "anxious": self = .anxious
            // ... mappings for other values
        default: return nil
        }
    }

    var rawValue: String {
        switch self {
        case .happy: return "happy"
        case .sad: return "sad"
        case .anxious: return "anxious"
            // ... return values for other cases
        }
    }
}



enum PhaseType: String {
    case follicular
    case luteal
    case ovulation
    case menstrual
    // (Optional) add a case for "Custom"
}
