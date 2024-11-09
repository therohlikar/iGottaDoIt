//
//  Flag.swift
//  iGottaDoIt
//
//  Created by Radek Jeník on 11/9/24.
//

import Foundation
import SwiftData
import SwiftUI


final class Flag {
    private var color: Color
    private var priority: Int
    
    init(color: Color, priority: Int) {
        self.color = color
        self.priority = priority
    }
    
    public func getColor() -> Color {
        return self.color
    }
    
    public func getPriority() -> Int {
        return self.priority
    }
}
