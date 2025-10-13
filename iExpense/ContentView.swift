//
//  ContentView.swift
//  iExpense
//
//  Created by Antonio Giroz on 11/10/25.
//

import Observation
import SwiftUI



struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var isShowingAdd = false
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(
                    title: "Personal",
                    expenses: expenses.personalItems,
                    deleteItems: removePersonalItems
                )
                
                ExpenseSection(
                    title: "Business",
                    expenses: expenses.businessItems,
                    deleteItems: removeBusinessItems
                )
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    isShowingAdd = true
                }
            }
            .sheet(isPresented: $isShowingAdd) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var indexesToDelete = IndexSet()

        for offset in offsets {
            let item = inputArray[offset]

            if let index = expenses.items.firstIndex(of: item) {
                indexesToDelete.insert(index)
            }
        }

        expenses.items.remove(atOffsets: indexesToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }

    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    ContentView()
}
