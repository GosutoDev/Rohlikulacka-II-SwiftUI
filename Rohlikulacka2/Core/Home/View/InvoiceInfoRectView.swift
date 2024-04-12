//
//  InvoiceInfoRectView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI

struct InvoiceInfoRectView: View {
    
    let invoiceColor: LinearGradient = LinearGradient(colors: [.pink, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Fakturace")
                    .font(.footnote)
                
                HStack {
                    Image(systemName: "creditcard.fill")
                    Text("45 500 Kc")
                }
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                HStack(spacing: 3) {
                    Text("411")
                        .font(.callout)
                    Image(systemName: "bag.fill")
                        .imageScale(.small)
                }
                
                Spacer()
                
                HStack(spacing: 3) {
                    Text("24")
                        .font(.callout)
                    Image(systemName: "calendar")
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
    InvoiceInfoRectView()
}
