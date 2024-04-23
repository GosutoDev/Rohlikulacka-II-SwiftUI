//
//  HomeView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var showSideMenu = false
    @State private var showRouteCreationSheet = false
    @State private var showVariablePayRateSheet = false
    
    let month: Month
    
    @State private var offset: CGFloat = 0
    @State private var lastStoredOffset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationLink {
                    InvoiceDetailView(month: month)
                } label: {
                    InvoiceInfoRectView(month: month)
                }
                
                Divider()
                    .padding(.horizontal)
               
                if month.days.isEmpty {
                        Text("Empty")
                    } else {
                        ListDaysView(showSheet: $showRouteCreationSheet, month: month)
                    }
            }
            .sheet(isPresented: $showVariablePayRateSheet) {
                Text("shit")
                    .presentationDetents([.fraction(0.3)])
            }
            .fullScreenCover(isPresented: $showRouteCreationSheet) {
                RouteCreationView(month: month)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle(month.displayHomeMonth)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        showVariablePayRateSheet.toggle()
                    } label: {
                        Image(.variablePayRate)
                            .font(.title2)
                            .tint(.primary)
                    }
                    
                    Button {
                        showRouteCreationSheet.toggle()
                    } label: {
                        Image(.plus)
                            .font(.title2)
                            .tint(.primary)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            showSideMenu.toggle()
                        }
                    } label: {
                        if !showSideMenu {
                            Image(.listBullet)
                                .font(.title2)
                                .tint(.primary)
                        }
                    }
                }
            }
            .navigationDestination(for: Month.self) { month in
                InvoiceDetailView(month: month)
            }
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(MockData.months)
    return ContentView()
        .modelContainer(preview.container)
}
