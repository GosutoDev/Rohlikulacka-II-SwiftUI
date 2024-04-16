//
//  DayDetailView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 15.04.2024.
//

import SwiftUI
import SwipeActions

struct DayDetailView: View {
    
    @State var showingStylesSwipeToDelete = true
    @State private var editDate = false
    @State private var datePicker = Date()
    
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
            ForEach(day.routes) { route in
                if showingStylesSwipeToDelete {
                    RouteCellView(route: route, delete: $showingStylesSwipeToDelete)
                }
                
            }
            .padding(.horizontal)
            .shadow(radius: 2)
        }
        .navigationTitle(editDate ? "" : day.displayDate)
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
        DayDetailView(day: MockData.days[0])
    }
}
