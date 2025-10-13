//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Antonio Giroz on 13/10/25.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
