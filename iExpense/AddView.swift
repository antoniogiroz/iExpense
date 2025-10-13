//
//  AddView.swift
//  iExpense
//
//  Created by Antonio Giroz on 13/10/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let expenses: Expenses
    
    let types = ["Business", "Personal"]
    let localCurrency = Locale.current.currency?.identifier ?? "EUR"
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: localCurrency))
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save", systemImage: "checkmark") {
                    let newExpense = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(newExpense)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
