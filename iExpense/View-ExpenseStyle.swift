//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Antonio Giroz on 13/10/25.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.green)
                .font(.body)
        } else if item.amount < 100 {
            return self.foregroundStyle(.orange)
                .font(.title3)
        } else {
            return self.foregroundStyle(.red)
                .font(.title2)
        }
    }
}
