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
    @State private var showVariablePayRateSheet = false
    @State private var navPath = NavigationPath()
    
    let month: Month = MockData.months.first!
    
    @State private var offset: CGFloat = 0
    @State private var lastStoredOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        HStack(spacing: 0) {
            
            SideMenuView(navPath: $navPath, showSideMenu: $showSideMenu)
            
            NavigationStack(path: $navPath) {
                
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
                .sheet(isPresented: $showVariablePayRateSheet) {
                    Text("shit")
                        .presentationDetents([.fraction(0.3)])
                }
                .fullScreenCover(isPresented: $showRouteCreationSheet) {
                    RouteCreationView()
                }
                .navigationTitle(month.displayHomeMonth)
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
            .frame(width: getRect().width)
            .overlay {
                Rectangle()
                    .fill(
                        Color.primary
                            .opacity(Double((offset / sideBarWidth / 5)))
                    )
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture {
                        withAnimation {
                            showSideMenu.toggle()
                        }
                    }
            }
            
        }
        .frame(width: getRect().width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: offset)
        .animation(.easeInOut, value: offset)
        .onChange(of: showSideMenu) { newValue in
            if showSideMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showSideMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
    }
}

#Preview {
    HomeView()
}
