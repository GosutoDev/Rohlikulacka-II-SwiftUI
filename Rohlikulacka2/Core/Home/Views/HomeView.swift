//
//  HomeView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSideMenu = false
    @State private var showInvoiceSheet = false
    
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
                            NavigationLink {
                                DayDetailView(day: day)
                            } label: {
                                DayCellView(day: day)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .foregroundStyle(.primary)   
                        }
                    }
                }
                if showSideMenu {
                    Color.primary.opacity(0.3)
                        .ignoresSafeArea()
                    
                    SideMenuView()
                }
            }
            
            .fullScreenCover(isPresented: $showInvoiceSheet) {
                RouteCreationView()
            }
            
            
            .navigationTitle(month.displayHomeMonth)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showInvoiceSheet.toggle()
                    } label: {
                        Image(.plus)
                            .font(.title2)
                            .tint(.primary)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            //                            showSideMenu.toggle()
                        }
                    } label: {
                        Image(.listBullet)
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
