//
//  Task.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftData

@Model
final class Task {
    var flag: Flag
    
    var timestamp: Date
    
    var note: String
    
    init(flag: Flag = Flag(0), timestamp: Date = Date.now, note: String = "") {
        self.flag = flag
        self.timestamp = timestamp
        self.note = note
    }
}


