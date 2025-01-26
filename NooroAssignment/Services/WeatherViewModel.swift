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
@MainActor
class WeatherViewModel {

    var searchKeyword: String = "" {
        didSet {
            if searchKeyword.count > 3 {
                Task {
                    await getWeatherForSearchedLocation(searchKeyword)
                }
            }
        }
    }

    var searchedWeather: WeatherResponse?

    private var weatherService = WeatherAPIService()

    private var localStorageService: LocalStorageService

    init(modelContext: ModelContext) {
        self.localStorageService = LocalStorageService(modelContext: modelContext)
    }

    var showSearchResult: Bool {
        return searchKeyword.count > 3 && searchedWeather != nil
    }

    func getWeatherForSavedLocation() async {
        guard let storedLocation = localStorageService.getWeather()?.location else {
            return
        }
        do {
            let weather = try await weatherService.getCurrentWeather(for: storedLocation.name)
            localStorageService.updateWeather(with: weather)
        } catch {
            print("Handle Error")
        }
    }

    func getWeatherForSearchedLocation(_ location: String) async {
        do {
            searchedWeather = try await weatherService.getCurrentWeather(for: location)
        } catch {
            print("Handle Error")
        }
    }

    func saveToLocalStorage(_ weather: WeatherResponse) {
        localStorageService.updateWeather(with: weather)
    }
}
