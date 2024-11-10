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
    var id: UUID
    
    var flag: Flag
    
    var timestamp: Date
    
    var note: String
    
    var done: Bool
    
    init(flag: Flag = Flag(), timestamp: Date = Date.now, note: String = "", done: Bool = false) {
        self.id = UUID()
        self.flag = flag
        self.timestamp = timestamp
        self.note = note
        self.done = done
    }
    
    var title: String {
        var temp: String = ""
        let characterLimit: Int = 30
        if self.note.isEmpty {
            temp = "To do task until \(self.timestamp)"
        }else{
            temp = self.note.count > characterLimit ? String(self.note.prefix(characterLimit)) + "..." : self.note
        }
        return temp
    }
}


