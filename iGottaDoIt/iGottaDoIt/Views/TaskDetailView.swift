//
//  TaskDetailView.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import SwiftUI
import SwiftData

struct TaskDetailView: View {
    @Bindable var task: Task
    
    var body: some View {
        Text("Item at \(task.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
        
        Text("Task subject: \(task.note)")
        
        Text("Task flag: \(task.flag.description)")
    }
}

#Preview {
    TaskDetailView(task: Task(note: "Do not use Grindr while having existential crisis"))
}
