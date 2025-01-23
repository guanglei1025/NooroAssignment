//
//  WeatherViewModel.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import Foundation
import Observation
import SwiftUI
import SwiftData

@Observable
class WeatherViewModel {

    var searchKeyword: String = ""

    var weather: WeatherResponse?

    private var weatherService = WeatherAPIService()

    private var localStorageService: LocalStorageService

    init(modelContext: ModelContext) {
        self.localStorageService = LocalStorageService(modelContext: modelContext)
    }

    var showSearchResult: Bool {
        return searchKeyword.count > 3
    }

    @MainActor
    func getWeatherData() async {
        do {
            let newWeather = try await weatherService.getCurrentWeather(for: "orlando")

            if var storedWeather = localStorageService.getWeather() {
                localStorageService.updateWeather(with: newWeather)
            } else {
                localStorageService.saveWeather(newWeather)
            }
            weather = newWeather

        } catch {
            guard let storedWeather = localStorageService.getWeather() else {
                return
            }
            weather = storedWeather
        }

    }
}
