//
//  RouteCreationView.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import Foundation

struct RouteCreationView: View {
    
    @State private var dateSelection = Date()
    @State private var orderSelection: Int = 10
    @State private var tipSelection: Int = 100
    @State private var regionSelection: String = "Brno"
    @State private var isBeyond: Bool = false
    @State private var bonusSelection: String = "zadny"
    
    @State private var unfoldOptionals = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollViewReader { proxy in
                    VStack(alignment: .leading) {
                        // date
                        DatePicker("Datum / Cas",
                                   selection: $dateSelection,
                                   displayedComponents: [.date, .hourAndMinute])
                            .tint(.black)
                            .font(.headline)
                            .padding(.vertical)
                            .id(0)
                        
                        Divider()
                        
                        // orders
                        RouteCreationCellView(selection: $orderSelection, title: "Pocet zakazek", data: Array(stride(from: 0, to: 100, by: 1)))
                        
                        Divider()
                        
                        // tips
                        RouteCreationCellView(selection: $tipSelection, title: "Spropitne", data: Array(stride(from: 0, to: 1005, by: 5)))
                        
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 8))
                    .shadow(radius: 2)
                    .padding()
                    
                    
                    
                    
                    // Optional setts
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Volitelne")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Image(.chevronDown)
                                .font(.title2)
                                .fontWeight(.bold)
                                .rotationEffect(.degrees(unfoldOptionals ? 180 : 0))
                        }
                        .background(.white.opacity(0.01))
                        .onTapGesture {
                            withAnimation(.bouncy) {
                                unfoldOptionals.toggle()
                                if unfoldOptionals {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation {
                                            proxy.scrollTo(1, anchor: .center)
                                        }
                                    }
                                } else {
                                    proxy.scrollTo(0, anchor: .top)
                                }
                            }
                        }
                        
                        if unfoldOptionals {
                            Divider()
                            
                            //regions
                            RouteCreationCellView(selection: $regionSelection, title: "Region", data: MockData.regions)
                            
                            Divider()
                            
                            // beyond the shift
                            Toggle("Nad ramec", isOn: $isBeyond)
                                .padding(.vertical)
                                .tint(Color(.systemGray))
                                .font(.headline)
                            
                            Divider()
                            
                            // Bonus
                            RouteCreationCellView(selection: $bonusSelection, title: "Bonus za blok", data: MockData.bonusPerBlock)
                        }
                        
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 8))
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    Button {
                        
                    } label: {
                        Text("Potvrdit")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.green)
                            .clipShape(.rect(cornerRadius: 8))
                            .shadow(radius: 2)
                            .padding()
                    }
                    .id(1)
                }
                
            }
            .navigationTitle("Nova trasa")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Zrusit") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Potvrdit") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .tint(.primary)
                }
            }
        }
    }
}

#Preview {
    RouteCreationView()
}
