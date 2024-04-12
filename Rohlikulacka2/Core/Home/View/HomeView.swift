//
//  HomeView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Button {
                    // action
                } label: {
                    InvoiceInfoRectView()
                }
                
                Divider()
                    .padding(.horizontal)
                
                LazyVStack(alignment: .leading) {
                    
                    Text("Odvezene trasy")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    ForEach(MockData.days) { day in
                        HomeListCellView(day: day)
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("Brezen 2024")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .tint(.green)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

struct SmallDetailToListCell: View {
    
    let image: String
    let numberInfo: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            Image(systemName: image)
                .imageScale(.medium)
            Text(String(numberInfo))
                .fontWeight(.semibold)
        }
        .font(.footnote)
    }
}
