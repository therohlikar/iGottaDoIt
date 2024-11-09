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
    private var flag: Flag
    
    private var timestamp: Date
    
    private var note: String
    
    init(flag: Flag, timestamp: Date, note: String) {
        self.flag = flag
        self.timestamp = timestamp
        self.note = note
    }
    
    public func getFlag() -> Flag {
        self.flag
    }
    
    public func getTimestamp() -> Date {
        self.timestamp
    }
    
    public func getNote() -> String {
        self.note
    }
}


