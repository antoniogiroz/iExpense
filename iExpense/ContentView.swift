//
//  ContentView.swift
//  iExpense
//
//  Created by Antonio Giroz on 11/10/25.
//

import Observation
import SwiftUI

extension View {
    func amount(_ value: Double) -> some View {
        var color: Color = .red
        if value < 10 {
            color = .green
        } else if value < 100 {
            color = .orange
        }
        
        return self.foregroundStyle(color)
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var isShowingAdd = false
    
    let localCurrency = Locale.current.currency?.identifier ?? "EUR"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: localCurrency))
                            .amount(item.amount)
                    }
                }
                .onDelete(perform: removeItems)
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
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
