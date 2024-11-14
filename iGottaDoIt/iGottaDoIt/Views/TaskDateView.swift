//
//  TaskDateView.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/14/24.
//

import SwiftUI
import Foundation

public struct TaskDateView: View {
    @Bindable var task: Task
    
    public var body: some View {
        VStack{
            Text("Select target date")
                .font(.title)
            
            DatePicker("Select target date", selection: $task.until)
                .datePickerStyle(.graphical)
                .padding()
            
            Text("Date is automatically saved, you can close the window by swiping down anytime")
                .font(.caption)
        }
    }
}

#Preview {
    TaskDateView(task: Task(note: "Do not use Grindr while having existential crisis"))
}
