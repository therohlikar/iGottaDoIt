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
    // notification
    // daily routine (basically repeater)
    // location
    
    var id: UUID
    
    var flag: Flag
    
    var until: Date
    
    var created: Date
    
    var note: String
    
    var done: Bool
    
    init(flag: Flag = Flag(), until: Date = Date.now, note: String = "", done: Bool = false) {
        self.id = UUID()
        self.created = Date.now
        self.flag = flag
        self.until = until
        self.note = note
        self.done = done
    }
    
    var title: String {
        var temp: String = ""
        let characterLimit: Int = 30
        if self.note.isEmpty {
            temp = "To do task until \(self.until)"
        }else{
            temp = self.note.count > characterLimit ? String(self.note.prefix(characterLimit)) + "..." : self.note
        }
        return temp
    }
}


