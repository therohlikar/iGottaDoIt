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
        VStack(alignment: .center){
            DatePicker("Select target date", selection: $task.until)
                .datePickerStyle(.graphical)
        }
    }
}
