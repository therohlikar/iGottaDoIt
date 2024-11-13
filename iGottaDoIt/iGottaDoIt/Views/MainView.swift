//
//  ContentView.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import SwiftUI
import SwiftData

enum Filters {
    case notDone
    case all
}

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var selectedFilter: Filters = .notDone
    
    var filteredTasks: [Task] {
        var temp = tasks.filter { task in
            switch selectedFilter {
            case .all:
                return true
            case .notDone:
                return !task.done
            }
        }
        
        temp.sort { !$0.done && $1.done }
        
        return temp
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredTasks) { task in
                    NavigationLink(destination: TaskDetailView(task: task)) {
                        HStack{
                            task.taskIcon
                            
                            Text(task.title)
                                .font(.title3)
                        }
                        
                    }
                }
                .onDelete(perform: deleteItems)
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
                    Button(action: filterTasks) {
                        Image(systemName: selectedFilter == .all ? "eye" : "eye.slash")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func filterTasks() {
        if selectedFilter == .all {
            selectedFilter = .notDone
        }else {
            selectedFilter = .all
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Task(flag: Flag(), until: Date.now, note: "Do not use Grindr while having existential crisis")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(for: Task.self, inMemory: true)
}
