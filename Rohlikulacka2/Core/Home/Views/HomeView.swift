//
//  HomeView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSideMenu = false
    @State private var showRouteCreationSheet = false
    
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
                    
                    ListDaysView(showSheet: $showRouteCreationSheet)
                }
                if showSideMenu {
                    Color.primary.opacity(0.3)
                        .ignoresSafeArea()
                    
                    SideMenuView()
                }
            }
            
            .fullScreenCover(isPresented: $showRouteCreationSheet) {
                RouteCreationView()
            }
            
            
            .navigationTitle(month.displayHomeMonth)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
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
