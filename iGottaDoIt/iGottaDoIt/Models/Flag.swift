//
//  Flag.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftData
import SwiftUI


struct Flag:Codable {
    var priority: Int
    
    init(_ priority: Int = 0) {
        self.priority = priority
    }

    var description: String {
        return "Flag(priority: \(priority))"
    }
}
