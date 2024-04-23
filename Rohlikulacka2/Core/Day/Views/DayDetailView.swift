//
//  DayDetailView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 15.04.2024.
//

import SwiftUI
import SwipeActions
import SwiftData

struct DayDetailView: View {
    
    @State private var editDate = false
    @State private var datePicker = Date()
    
    @Query(sort: \Route.date, order: .reverse) private var routes: [Route]
    var month: Month
    var day: Day
    
    var body: some View {
        
        if editDate {
            DatePicker(selection: $datePicker, displayedComponents: .date) {
                Text("Datum")
                    .font(.headline)
            }
            .tint(.black)
            .datePickerStyle(.graphical)
            .padding()
            .background(Color(.systemGray6))
            .clipShape(.rect(cornerRadius: 8))
            .shadow(radius: 2)
            .padding()
        }
        
        ScrollView {
            ForEach(routes) { route in
                RouteView(month: month, day: day, route: route)
                    .padding(.vertical, 5)
            }
            .padding(.horizontal)
            .shadow(radius: 2)
        }
        .navigationTitle(editDate ? "" : day.displayDate)
        .navigationBarTitleDisplayMode(editDate ? .inline : .large)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(editDate ? "Potvrdit" : "Zmenit datum") {
                    withAnimation {
                        editDate.toggle()
                    }
                }
                .fontWeight(.semibold)
                .foregroundStyle(editDate ? .green : .primary)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DayDetailView(month: MockData.months[0], day: MockData.days[0])
    }
}


