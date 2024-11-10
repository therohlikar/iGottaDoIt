//
//  FlagPriority.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/10/24.
//

import Foundation
import SwiftUI

enum FlagPriority: Int, Codable {
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
    
    var getPriorityInColor: Color{
        switch self{
        case .veryLow:
            return .black
        case .low:
            return .yellow
        case .medium:
            return .orange
        case .high:
            return .purple
        case .veryHigh:
            return .red
        }
    }
    
    func nextHigherPriority() -> FlagPriority {
        return FlagPriority(rawValue: self.rawValue + 1) ?? .veryHigh
    }
}
