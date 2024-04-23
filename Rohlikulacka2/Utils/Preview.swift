//
//  Preview.swift
//  Rohlikulacka2
//
//  Created by Tomáš Duchoslav on 23.04.2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let schema = Schema([Month.self, Day.self])
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch  {
            fatalError("Could not load container")
        }
    }
    
    @MainActor
    func addExamples(_ examples: [Month]) {
        Task {
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
    }
}
