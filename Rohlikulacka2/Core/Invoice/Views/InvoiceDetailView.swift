//
//  InvoiceDetailView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct InvoiceDetailView: View {
    
    let month: Month
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Přehled služeb")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                
                VStack {
                    HStack {
                        Text("\(month.displayInvoiceMonth)")
                        Spacer()
                        Text("\(month.earnPerMonth) Kc")
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    
                    Spacer()
                    Text("Standardni trasy")
                }
                .padding(10)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 8))
                .shadow(radius: 2)
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButtonView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        InvoiceDetailView(month: MockData.months.first!)
    }
}
