//
//  InvoiceInfoRectView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct InvoiceInfoRectView: View {
    
    let invoiceColor: LinearGradient = LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let month: Month
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Přehled služeb")
                    .font(.footnote)
                
                HStack {
                    Image(.creditcardFill)
                    Text("\(month.earnPerMonth) Kc")
                }
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack(spacing: 3) {
                    Text("\(month.ordersPerMonth)")
                        .font(.callout)
                    Image(.bagFill)
                        .imageScale(.small)
                }
                
                Spacer()
                
                HStack(spacing: 3) {
                    Text("\(month.workDays)")
                        .font(.callout)
                    Image(.calendar)
                        .imageScale(.small)
                }
            }
        }
        .foregroundStyle(.white)
        .padding()
        .background(invoiceColor)
        .clipShape(.rect(cornerRadius: 8))
        .shadow(radius: 2)
        .padding()
    }
}

#Preview {
    InvoiceInfoRectView(month: MockData.months.first!)
}
