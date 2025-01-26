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

    var searchedWeather: WeatherResponse?

    private var weatherService = WeatherAPIService()

    private var localStorageService: LocalStorageService

    init(modelContext: ModelContext) {
        self.localStorageService = LocalStorageService(modelContext: modelContext)
    }

    var showSearchResult: Bool {
        return searchKeyword.count > 3
    }

//    @MainActor
//    func getWeatherData() async {
//        do {
//            let newWeather = try await weatherService.getCurrentWeather(for: "miami")
//            localStorageService.updateWeather(with: newWeather)
//
//            searchedWeather = newWeather
//
//        } catch {
//            guard let storedWeather = localStorageService.getWeather() else {
//                return
//            }
//            searchedWeather = storedWeather
//        }
//    }

    @MainActor
    func getWeatherForSavedData(_ temp: String) async {
        print(temp)
    }

    @MainActor
    func saveWeatherToLocalStorage() {
        guard let weatherData = searchedWeather else {
            return
        }
        localStorageService.updateWeather(with: weatherData)
    }
}
