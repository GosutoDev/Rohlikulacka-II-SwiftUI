//
//  Rohlikulacka2App.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 12.04.2024.
//

import SwiftUI
import SwiftData

@main
struct Rohlikulacka2App: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
           ContentView()
                .modelContainer(container)
        }
    }
    
    init() {
        let schema = Schema([
            Month.self,
            Day.self,
            Route.self,
            VariablePayRate.self])
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch  {
            fatalError("Could not load persistance container")
        }
        
        print(URL.documentsDirectory.path())
    }
    
}
