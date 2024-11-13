//
//  Task.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftData
import SwiftUI

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
    
    var finishedDate: Date?
    
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
    
    func completeTask() {
        self.done.toggle()
        
        self.finishedDate = (self.done ? Date.now : nil)
    }
    
    var taskIcon: some View {
        if !self.done {
            return AnyView(
                self.flag.image
                    .onTapGesture {
                        self.flag.setHigherPriority()
                    }
                    .padding(.trailing)
            
            )
        }
        
        return AnyView(
            Image(systemName: "checkmark.circle.fill")
            .foregroundStyle(.white)
            .padding(1)
            .background{
                RoundedRectangle(cornerRadius: 180)
                    .fill(.blue)
                    .frame(width: 30, height: 30)
            }
            .padding(.horizontal, 3)
        )
        
    }
}


