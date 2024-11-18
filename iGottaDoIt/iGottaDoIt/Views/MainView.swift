//
//  ContentView.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var path: [Task]  = []
    @State private var filterFlag: FilterFlag = .notDone
    
    var filteredTasks: [Task] {
        var temp = tasks.filter { task in
            switch filterFlag {
            case .all:
                return true
            case .notDone:
                return !task.done
            }
        }
        
        temp.sort { $0.until < $1.until }
        
        if filterFlag == .all {
            //the already sorted array by timestamp sort by done, so completed tasks are in the end and also sorted by the date
            temp.sort { !$0.done && $1.done }
        }
        
        return temp
    }

    var body: some View {
        NavigationStack(path: $path) {
            List(filteredTasks) { task in
                NavigationLink(value: task, label: {
                    HStack{
                        task.taskIcon
                        
                        Text(task.title)
                            .font(.title3)
                    }
                })
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: {
                        task.done.toggle()
                    }) {
                        Image(systemName: task.done ? "checkmark.circle.fill" : "checkmark.circle")
                            .tint(.blue)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(role: .destructive, action: { deleteItem(task: task)
                    }) {
                        Image(systemName: "trash")
                            .tint(.red)
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button(action: addItem) {
                        Text("+")
                            .font(Font.system(size: .init(50)))
                            .frame(width: 35, height: 35, alignment: .center)
                            .padding(4)
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(action: viewUnfiltered) {
                        Image(systemName: filterFlag == .all ? "eye" : "eye.slash")
                    }
                }
            }
            .navigationDestination(for: Task.self) { task in
                TaskDetailView(task: task)
            }
        }
    }
    
    private func viewUnfiltered() {
        if filterFlag == .all {
            filterFlag = .notDone
        }else {
            filterFlag = .all
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Task(flag: Flag(), until: Date.now, note: "Do not use Grindr while having existential crisis")
            modelContext.insert(newItem)
            
            path.append(newItem)
        }
    }

    private func deleteItem(task: Task) {
        withAnimation {
            modelContext.delete(task)
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: Task.self, inMemory: true)
}
