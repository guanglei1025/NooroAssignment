//
//  MockModelContext.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/26/25.
//

import Foundation
import SwiftData

extension ModelContext {
    @MainActor static func mock() -> ModelContext {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)

            let modelContext = try ModelContainer(for: WeatherResponse.self, configurations: config).mainContext

            return modelContext
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }
}
