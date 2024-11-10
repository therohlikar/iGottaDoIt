//
//  Flag.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftData
import SwiftUI


struct Flag {
    var priority: FlagPriority
    
    init(_ priority: FlagPriority = FlagPriority.low) {
        self.priority = priority
    }

    var description: String {
        return "Flag(priority: \(priority.description))"
    }
}
