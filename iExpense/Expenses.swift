//
//  Expenses.swift
//  iExpense
//
//  Created by Antonio Giroz on 13/10/25.
//

import Observation
import SwiftUI

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        guard
            let savedItems = UserDefaults.standard.data(forKey: "Items"),
            let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems)
        else {
            items = []
            return
        }
        
        items = decodedItems
    }
}
