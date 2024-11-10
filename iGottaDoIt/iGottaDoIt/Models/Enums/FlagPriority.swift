//
//  FlagPriority.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/10/24.
//

enum FlagPriority: Int {
    case veryLow = 1
    case low = 2
    case medium = 3
    case high = 4
    case veryHigh = 5

    var description: String {
        switch self {
        case .veryLow:
            return "Very Low Priority"
        case .low:
            return "Low Priority"
        case .medium:
            return "Medium Priority"
        case .high:
            return "High Priority"
        case .veryHigh:
            return "Very High Priority"
        }
    }
}