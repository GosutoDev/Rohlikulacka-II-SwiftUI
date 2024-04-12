//
//  HomeView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSideMenu = false
    @State private var showSheet = false
    
    let month: Month = MockData.months.first!
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    NavigationLink {
                        InvoiceDetailView(month: month)
                    } label: {
                        InvoiceInfoRectView(month: month)
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    LazyVStack(alignment: .leading) {
                        
                        Text("Odvezené trasy")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ForEach(MockData.days) { day in
                            HomeListCellView(day: day)
                                .padding(.horizontal)
                                .padding(.vertical, 6)
                        }
                    }
                }
                if showSideMenu {
                    Color.primary.opacity(0.3)
                        .ignoresSafeArea()
                    
                    SideMenuView()
                }
            }
            
            .fullScreenCover(isPresented: $showSheet) {
                RouteCreationView()
            }
            
            
            .navigationTitle(month.displayHomeMonth)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
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
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .tint(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
