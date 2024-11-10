//
//  Flag.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftUI


struct Flag: Codable {
    var priority: FlagPriority
    
    init(_ priority: FlagPriority = FlagPriority.veryLow) {
        self.priority = priority
    }

    var description: String {
        return "Flag(priority: \(priority.description))"
    }
    
    var image: some View {
        return Image(systemName: "flag").foregroundStyle(self.priority.getPriorityInColor)
    }
    
    mutating func setHigherPriority() {
            self.priority = self.priority.nextHigherPriority()
        }
}
