//
//  FilterOptions.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/18/24.
//

struct FilterOptions{
    private var showCompleted: Bool = false
    
    private var priorities: [FlagPriority] = []
    
    init(showCompleted: Bool = false, priorities: [FlagPriority] = []) {
        self.showCompleted = showCompleted
        self.priorities = priorities
    }
    
    public mutating func toggleShowCompleted() {
        showCompleted.toggle()
    }
    
    public func getShowCompleted() -> Bool {
        return showCompleted
    }
    
    public func getPriorities() -> [FlagPriority] {
        return priorities
    }
}
