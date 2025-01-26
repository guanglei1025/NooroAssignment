//
//  MockModelContext.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/26/25.
//

import Foundation
import SwiftData

extension ModelContext {
    @MainActor
    static func mock() throws -> ModelContext {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try ModelContainer(for: WeatherResponse.self, configurations: config).mainContext
    }
}
