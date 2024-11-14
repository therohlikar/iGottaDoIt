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
    @State private var dateViewVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, content: {
            TextField("", text: $task.note, axis: .vertical)
                .font(.title2)
                .bold()
                .padding()
            
            VStack{
                HStack{
                    task.flag.image
                        
                    Text("\(task.flag.priority.description)")
                }
                .onTapGesture {
                    task.flag.setHigherPriority()
                }
                .padding()
            }
            
            Text("Task is being done since \(task.created, format: Date.FormatStyle(date: .complete, time: .shortened))")
                .padding(.horizontal)
            Text("and is to be done until \(task.until, format: Date.FormatStyle(date: .complete, time: .shortened))")
                .padding(.horizontal)
                .onTapGesture {
                    dateViewVisible.toggle()
                }
            
            if task.finishedDate != nil{
                Text("Task has been completed on \(task.finishedDate!, format: Date.FormatStyle(date: .complete, time: .shortened))")
                    .padding(.horizontal)
            }
            
            Spacer()
        })
        .padding()
        .sheet(isPresented: $dateViewVisible, content: {
            EmptyView()
        })
        
        VStack(alignment: .center){
            Button(action: finishTask){
                Label("Task is \(self.task.doneLabel)", systemImage: self.task.done ? "checkmark.circle.fill" : "circle")
            }
            .padding()
        }
    }
    
    private func finishTask(){
        self.task.completeTask()
    }
}

#Preview {
    TaskDetailView(task: Task(note: "Do not use Grindr while having existential crisis"))
}
