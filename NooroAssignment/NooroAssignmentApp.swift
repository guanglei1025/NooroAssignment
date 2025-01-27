//
//  NooroAssignmentApp.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import SwiftUI
import SwiftData

@main
struct NooroAssignmentApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Weather.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            WeatherContainerView(modelContext: sharedModelContainer.mainContext)
                .modelContainer(sharedModelContainer)
        }
    }
}
