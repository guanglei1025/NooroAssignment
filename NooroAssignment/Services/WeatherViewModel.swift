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

    var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    var showSearchResult: Bool {
        return searchKeyword.count > 3
    }

    @MainActor
    func getWeatherData() async {
        do {
            weather = try await weatherService.getCurrentWeather(for: "miami")
        } catch {
            print("handle get weather error")
        }
    }
}
