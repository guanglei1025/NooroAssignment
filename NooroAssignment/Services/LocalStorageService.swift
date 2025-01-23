//
//  LocalStorageService.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/23/25.
//

import Foundation
import SwiftData
import os

class LocalStorageService {

    let viewModelLog = OSLog(subsystem: "com.WeatherApp", category: "LocalStorageService")

    private var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func saveWeather(_ weather: WeatherResponse) {
        modelContext.insert(weather)
    }

    func updateWeather(with newWeather: WeatherResponse) {
        if let storedWeather = getWeather() {
            storedWeather.current = newWeather.current
            storedWeather.location = newWeather.location
            saveModelContext()
        }
    }

    func getWeather() -> WeatherResponse? {
        let fetchRequest = FetchDescriptor<WeatherResponse>()
        do {
            return try modelContext.fetch(fetchRequest).first
        } catch {
            return nil
        }
    }

    private func saveModelContext(){
        do {
            try modelContext.save()
        } catch {
            os_log("Failed to save in model context", log: viewModelLog, type: .debug)
        }
    }
}
