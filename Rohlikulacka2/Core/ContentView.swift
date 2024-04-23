//
//  ContentView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var months: [Month]
    @Environment(\.modelContext) private var context
    
    let currentDateString = Date().formatted(
        .dateTime
            .locale(Locale(identifier: "cs"))
            .month(.wide)
            .year(.defaultDigits))
        .capitalized
    
    var body: some View {
        ZStack {
            checkForMonth(months)
        }
        .task {
            await addCurrentMonth(months)
        }
    }
}

extension ContentView {
    private func addCurrentMonth(_ months: [Month]) async {
        if !months.contains(where: { $0.displayHomeMonth == currentDateString }) {
            let month = Month(days: [], month: Date())
            context.insert(month)
        }
    }
    
    @ViewBuilder
    private func checkForMonth(_ months: [Month]) -> some View {
        let index = months.firstIndex(where: { $0.displayHomeMonth == currentDateString })
        if let index = index {
            HomeView(month: months[index])
        } else {
            ProgressView()
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(MockData.months)
    return ContentView()
        .modelContainer(preview.container)
}
